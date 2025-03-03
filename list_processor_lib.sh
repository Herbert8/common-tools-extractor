# 本文件只用于 source，不直接运行
# 设计思路：
#   本工具用于下载指定软件列表中的工具。
#   由于需要获得 最新版 和 指定平台软件 的 下载链接，所以需要调用 GitHub API
#   由于 GitHub 的 API 有调用频次限制，所以设计为：
#       1、本文件用于解析这些地址，然后存储到指定列表（避免频繁调用 GitHub API），可以定期、不频繁地执行
#       2、需要下载时，只要根据得到的列表下载、提取即可

GITHUB_ACCESS_TOKEN=''
readonly GITHUB_ACCESS_TOKEN

log() {
    local timestamp
    timestamp=$(gdate '+%Y-%m-%d %H:%M:%S.%3N')
    echo -e "\033[1;92m[$timestamp] [${FUNCNAME[1]}:${BASH_LINENO[0]}]\033[0m" "$@" >&2
}

clear_software_array_list() {
    TOOL_NAME=()
    TOOL_HOMEPAGE=()
    TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX=()
    TOOL_DOWNLOAD_URL=()
    TOOL_ARCHIVE_PROCESSOR=()
    TOOL_BIN_FILE_IN_ARCHIVE=()
    TOOL_BIN_FILE=()
}

# 根据 工具 GitHub 首页，获取 所有者和仓库名
get_github_owner_repo_from_homepage_url() {
    # 仓库所在首页
    local homepage_url=$1
    sed -nr 's|.*github.com/(.*/.*)|\1|p' <<<"$homepage_url"
}

# Function: get_github_query_lastest_release_download_api_url
# Description: 根据工具所在 GitHub 首页得到用于获取最新发布版本信息的 API 的 URL
# Parameters:
#   $1 - 工具所在 GitHub 首页
# Returns: 用于查询的 API 的 URL
# Example: get_github_query_lastest_release_download_api_url 'https://github.com/ginuerzh/gost'
get_github_query_lastest_release_download_api_url() {
    # 仓库所在首页
    local homepage_url=$1
    local owner_repo
    owner_repo=$(get_github_owner_repo_from_homepage_url "$homepage_url")
    # echo "https://api.github.com/repos/${owner_repo}/releases/latest"
    echo "https://api.github.com/repos/${owner_repo}/releases/latest"
}

# Function: get_download_url
# Description: 通过 API 获取最新发布内容的 JSON，并提取其中下载的 URL
# Parameters:
#   $1 - 用于查询的 API 的 URL
# Returns: 软件包 URL
# Example: get_download_url 'https://api.github.com/repos/ginuerzh/gost/releases/latest'
get_download_url() {
    local api_url=$1
    curl -H "Authorization: token $GITHUB_ACCESS_TOKEN" -fsSL "$api_url" | jq -r '.assets[] | .browser_download_url'
}

# Function: get_api_url_by_name
# Description: 根据软件名称（GitHub首页地址的最后部分）得到获取信息的 API 的 URL
# Parameters:
#   $1 - 工具的名字
# Returns: 获得这个工具查询相关信息的 API
# Example: get_api_url_by_name gost
get_api_url_by_name() {
    # 通过 工具在 GitHub 首页的地址，获取其名字
    get_name_from_homepage_url() {
        local homepage_url=$1
        local tmp_name
        tmp_name=$(gsed -nr 's/.*\/(\S*$)/\1/p' <<<"$homepage_url")
        # 如果存在 / 则清除
        echo "${tmp_name//\//}"
    }

    local tool_name_to_find=$1
    # 软件列表中总数量
    local count=${#TOOL_NAME[@]}
    # 遍历列表中所有 GitHub 上的工具
    for ((i = 0; i < count; i++)); do
        # 通过软件主页地址，判断是否在 GitHub 上
        # 如果不在 GitHub 上则不处理
        # 如果名称不匹配也不处理
        local homepage_url=${TOOL_HOMEPAGE[i]}
        if ! [[ "$homepage_url" = *github* && $(get_name_from_homepage_url "$homepage_url") == "$tool_name_to_find" ]]; then
            continue
        fi

        # 获取 API URL
        get_github_query_lastest_release_download_api_url "${homepage_url}"
        break
    done
}

clear

# tool_name=$1
# tool_name=gost

# api_url=$(get_api_url_by_name "$tool_name")

# all_download_url=$(get_download_url "$api_url")
# echo "$all_download_url" | grep 'linux.*amd64'

# 解析列表中所有软件地址，生成列表，存入指定文件
get_all_github_software_download_url() {

    local github_download_url_list_file=$1
    if [[ -f "$github_download_url_list_file" ]]; then
        echo "File '$github_download_url_list_file' exists."
        return 1
    fi

    # 创建/清理 文件
    : >"$github_download_url_list_file"

    # 软件列表中总数量
    local count=${#TOOL_NAME[@]}

    # 遍历列表中所有 GitHub 上的工具
    for ((i = 0; i < count; i++)); do
        # 通过软件主页地址，判断是否在 GitHub 上
        # 如果不在 GitHub 上则不处理
        # 如果名称不匹配也不处理
        local homepage_url=${TOOL_HOMEPAGE[i]}
        if ! [[ "$homepage_url" = *github* ]]; then
            continue
        fi

        local owner_repo
        owner_repo=$(get_github_owner_repo_from_homepage_url "${homepage_url}")

        local api_url
        api_url=$(get_github_query_lastest_release_download_api_url "${homepage_url}")

        # 获取 API URL
        local urls
        urls=$(get_download_url "$api_url")

        log "$homepage_url"
        echo >&2 "API URL             = $api_url"
        echo >&2 "All Dl URLs Command = curl -H 'Authorization: token $GITHUB_ACCESS_TOKEN' -fsSL '$api_url' | jq -r '.assets[] | .browser_download_url'"
        echo >&2 "URL Filter          = ${TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX[i]}"
        local download_url
        download_url=$(grep "${TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX[i]}" <<<"$urls")

        echo >&2 "Download Url        = $owner_repo=$download_url"
        echo "$owner_repo=$download_url" >>"$github_download_url_list_file"

        # sleep 2
    done
}

# get_all_github_software_download_url

# api_url=$(get_api_url_by_name croc)
# get_download_url "$api_url" #| grep 'x86_64.*linux.*musl'

# 从指定列表文件，读取软件下载地址
load_github_download_url_list() {

    local github_download_url_list_file=$1

    if ! [[ -f "$github_download_url_list_file" ]]; then
        echo "File '$github_download_url_list_file' does not exist."
        return 1
    fi

    # 通过文件加载数据
    local all_url_data
    all_url_data=$(<"$github_download_url_list_file")

    # 软件列表中总数量
    local count=${#TOOL_NAME[@]}

    # 遍历列表中所有 GitHub 上的工具
    for ((i = 0; i < count; i++)); do
        # 通过软件主页地址，判断是否在 GitHub 上
        # 如果不在 GitHub 上则不处理
        # 如果名称不匹配也不处理
        local homepage_url=${TOOL_HOMEPAGE[i]}
        if ! [[ "$homepage_url" = *github* ]]; then
            continue
        fi

        # 得到 账号/仓库
        local owner_repo
        owner_repo=$(get_github_owner_repo_from_homepage_url "${homepage_url}")

        # 通过 账号/仓库 得到对应数据
        local a_url_data
        # 不存在则跳出本次循环
        # 拿到一条 URL
        a_url_data=$(grep "$owner_repo" <<<"$all_url_data") || continue

        local download_url
        download_url=$(cut -d '=' -f2 <<<"$a_url_data")

        TOOL_DOWNLOAD_URL[i]=$download_url
    done
}

# BASE_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
# load_github_download_url_list "$BASE_DIR/data/github_download_url_list.txt"


# webdav 已经不再鼓励使用，但还能用
# https://github.com/hacdias/webdav
# idx=${#TOOL_NAME[@]}
# TOOL_NAME["$idx"]='WebDAV'
# TOOL_DOWNLOAD_URL["$idx"]='https://github.com/hacdias/webdav/releases/latest/download/linux-amd64-webdav.tar.gz'
# TOOL_ARCHIVE_PROCESSOR["$idx"]=targz_extractor
# TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='webdav'
# TOOL_BIN_FILE["$idx"]='webdav'

# WebDAV 已处于 归档状态，推荐使用 sftpgo
# SFTPGo
# https://github.com/drakkan/sftpgo

# static build app ===========================================================================================

# STATIC_TOOL_PATH="$TOOLS_PATH/static"
# mkdir -p "$STATIC_TOOL_PATH"

# static-binaries -- nmap
# https://github.com/andrew-d/static-binaries
# echo
# echo
# nmap_url='https://raw.githubusercontent.com/andrew-d/static-binaries/master/binaries/linux/x86_64/nmap'
# nmap_file="$STATIC_TOOL_PATH/nmap"
# show_info 'nmap' "$nmap_file"
# download "$nmap_url" > "$nmap_file"
# install "$nmap_file"

# static-binaries -- ncat
# https://github.com/andrew-d/static-binaries
# echo
# echo
# ncat_url='https://raw.githubusercontent.com/andrew-d/static-binaries/master/binaries/linux/x86_64/ncat'
# ncat_file="$STATIC_TOOL_PATH/ncat"
# show_info 'ncat' "$ncat_file"
# download "$ncat_url" > "$ncat_file"
# install "$ncat_file"

# static-binaries -- socat
# https://github.com/andrew-d/static-binaries
# echo
# echo
# socat_url='https://raw.githubusercontent.com/andrew-d/static-binaries/master/binaries/linux/x86_64/socat'
# socat_file="$STATIC_TOOL_PATH/socat"
# show_info 'socat' "$socat_file"
# download "$socat_url" > "$socat_file"
# install "$socat_file"

# static-binaries -- ht
# https://github.com/andrew-d/static-binaries
# echo
# echo
# ht_url='https://raw.githubusercontent.com/andrew-d/static-binaries/master/binaries/linux/x86_64/ht'
# ht_file="$TOOLS_PATH/ht"
# show_info 'ht' "$ht_file"
# download "$ht_url" > "$ht_file"
# install "$ht_file"

# k8s tools ============================================================================================

# K8S_TOOL_PATH="$TOOLS_PATH/k8s"
# mkdir -p "$K8S_TOOL_PATH"

# kubectl
# https://kubernetes.io/docs/tasks/tools/#kubectl
# echo
# echo
# kubectl_url="https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# kubectl_file="$K8S_TOOL_PATH/kubectl"
# show_info 'kubectl' "$kubectl_file"
# download "$kubectl_url" > "$kubectl_file"
# install "$kubectl_file"

# k3s ==========================================================================
# k3s
# https://github.com/k3s-io/k3s
# echo
# echo
# k3s_url='https://github.com/k3s-io/k3s/releases/latest/download/k3s'
# k3s_file="$K8S_TOOL_PATH/k3s"
# show_info 'k3s' "$k3s_file"
# download "$k3s_url" > "$k3s_file"
# install "$k3s_file"
