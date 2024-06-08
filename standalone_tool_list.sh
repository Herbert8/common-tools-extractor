# 7-Zip
TOOL_NAME+=('7-Zip')
TOOL_HOMEPAGE+=('https://www.7-zip.org/')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('')
TOOL_DOWNLOAD_URL+=('https://www.7-zip.org/a/7z2406-linux-x64.tar.xz')
TOOL_ARCHIVE_PROCESSOR+=(tarxz_extractor)
TOOL_BIN_FILE_IN_ARCHIVE+=('7zzs')
TOOL_BIN_FILE+=(7zz)

# bandwhich
TOOL_NAME+=('bandwhich')
TOOL_HOMEPAGE+=('https://github.com/imsnif/bandwhich')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('x86_64.*linux-musl')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(targz_extractor)
TOOL_BIN_FILE_IN_ARCHIVE+=('bandwhich')
TOOL_BIN_FILE+=('bandwhich')

# bat
TOOL_NAME+=('bat')
TOOL_HOMEPAGE+=('https://github.com/sharkdp/bat')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('x86_64.*linux-musl')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(targz_extractor)
TOOL_BIN_FILE_IN_ARCHIVE+=('s|.*/(.*)\.tar\.gz|\1/bat|p')
TOOL_BIN_FILE+=('bat')

# Brook
TOOL_NAME+=('Brook')
TOOL_HOMEPAGE+=('https://github.com/txthinking/brook')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('brook_linux_amd64')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(bin_extractor)
TOOL_BIN_FILE_IN_ARCHIVE+=('linux_amd64')
TOOL_BIN_FILE+=(brook)

# Broot
TOOL_NAME+=('Broot')
TOOL_HOMEPAGE+=('https://github.com/Canop/broot')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(zipfile_extractor)
TOOL_BIN_FILE_IN_ARCHIVE+=('x86_64-unknown-linux-musl/broot')
TOOL_BIN_FILE+=('broot')

# btop
TOOL_NAME+=('btop')
TOOL_HOMEPAGE+=('https://github.com/aristocratos/btop')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('x86_64.*linux-musl')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(tarbz_extractor)
TOOL_BIN_FILE_IN_ARCHIVE+=('./btop/bin/btop')
TOOL_BIN_FILE+=('btop')

# uutils coreutils
TOOL_NAME+=('uutils coreutils')
TOOL_HOMEPAGE+=('https://github.com/uutils/coreutils')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('x86_64.*linux-musl')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(targz_extractor)
# TOOL_BIN_FILE_IN_ARCHIVE+=('coreutils-0.0.26-x86_64-unknown-linux-musl/coreutils')
TOOL_BIN_FILE_IN_ARCHIVE+=('s|.*/(.*)\.tar\.gz|\1/coreutils|p')
TOOL_BIN_FILE+=('coreutils')

# Curlie
TOOL_NAME+=('Curlie')
TOOL_HOMEPAGE+=('https://github.com/rs/curlie')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('linux.*amd64.*tar')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(targz_extractor)
TOOL_BIN_FILE_IN_ARCHIVE+=('curlie')
TOOL_BIN_FILE+=('curlie')

# croc
TOOL_NAME+=('croc')
TOOL_HOMEPAGE+=('https://github.com/schollz/croc')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('Linux.*64bit')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(targz_extractor)
TOOL_BIN_FILE_IN_ARCHIVE+=('croc')
TOOL_BIN_FILE+=(croc)

# delta
TOOL_NAME+=('delta')
TOOL_HOMEPAGE+=('https://github.com/dandavison/delta')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('linux.*musl')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(targz_extractor)
# TOOL_BIN_FILE_IN_ARCHIVE+=('delta-0.17.0-x86_64-unknown-linux-musl/delta')
TOOL_BIN_FILE_IN_ARCHIVE+=('s|.*/(.*)\.tar\.gz|\1/delta|p')
TOOL_BIN_FILE+=('delta')

# Dive
TOOL_NAME+=('Dive')
TOOL_HOMEPAGE+=('https://github.com/wagoodman/dive')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('linux.*amd64.*tar')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(targz_extractor)
TOOL_BIN_FILE_IN_ARCHIVE+=('dive')
TOOL_BIN_FILE+=(dive)

# Docker Compose
TOOL_NAME+=('Docker Compose')
TOOL_HOMEPAGE+=('https://docs.docker.com/compose/install/')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('')
TOOL_DOWNLOAD_URL+=('https://github.com/docker/compose/releases/latest/download/docker-compose-Linux-x86_64')
TOOL_ARCHIVE_PROCESSOR+=(bin_extractor)
TOOL_BIN_FILE_IN_ARCHIVE+=('')
TOOL_BIN_FILE+=(docker-compose)

# duf
TOOL_NAME+=('duf')
TOOL_HOMEPAGE+=('https://github.com/muesli/duf')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('linux.*x86_64')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(targz_extractor)
TOOL_BIN_FILE_IN_ARCHIVE+=('duf')
TOOL_BIN_FILE+=('duf')

# Dust
TOOL_NAME+=('Dust')
TOOL_HOMEPAGE+=('https://github.com/bootandy/dust')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('x86_64.*linux.*musl')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(targz_extractor)
# TOOL_BIN_FILE_IN_ARCHIVE+=('dust-v1.0.0-x86_64-unknown-linux-musl/dust')
TOOL_BIN_FILE_IN_ARCHIVE+=('s|.*/(.*)\.tar\.gz|\1/dust|p')
TOOL_BIN_FILE+=(dust)

# exa
TOOL_NAME+=('exa')
TOOL_HOMEPAGE+=('https://github.com/ogham/exa')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('linux.*x86_64.*musl')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(zipfile_extractor)
TOOL_BIN_FILE_IN_ARCHIVE+=('bin/exa')
TOOL_BIN_FILE+=('exa')

# fd
TOOL_NAME+=('fd')
TOOL_HOMEPAGE+=('https://github.com/sharkdp/fd')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('x86_64.*linux.*musl')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(targz_extractor)
# TOOL_BIN_FILE_IN_ARCHIVE+=('fd-v10.1.0-x86_64-unknown-linux-musl/fd')
TOOL_BIN_FILE_IN_ARCHIVE+=('s|.*/(.*)\.tar\.gz|\1/fd|p')
TOOL_BIN_FILE+=(fd)

# fzf
TOOL_NAME+=('fzf')
TOOL_HOMEPAGE+=('https://github.com/junegunn/fzf')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('linux.*amd64')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(targz_extractor)
TOOL_BIN_FILE_IN_ARCHIVE+=('fzf')
TOOL_BIN_FILE+=(fzf)

# fx
TOOL_NAME+=('fx')
TOOL_HOMEPAGE+=('https://github.com/antonmedv/fx')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('linux_amd64')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(bin_extractor)
TOOL_BIN_FILE_IN_ARCHIVE+=('')
TOOL_BIN_FILE+=(fx)

# GitUI
TOOL_NAME+=('GitUI')
TOOL_HOMEPAGE+=('https://github.com/extrawurst/gitui')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('linux.*x86_64')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(targz_extractor)
TOOL_BIN_FILE_IN_ARCHIVE+=('./gitui')
TOOL_BIN_FILE+=(gitui)

# Glow
TOOL_NAME+=('Glow')
TOOL_HOMEPAGE+=('https://github.com/charmbracelet/glow')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('glow_Linux_x86_64.*gz$')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(targz_extractor)
TOOL_BIN_FILE_IN_ARCHIVE+=('glow')
TOOL_BIN_FILE+=(glow)

# GO Simple Tunnel
TOOL_NAME+=('GO Simple Tunnel')
TOOL_HOMEPAGE+=('https://github.com/ginuerzh/gost')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('linux.*amd64')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(gz_extractor)
TOOL_BIN_FILE_IN_ARCHIVE+=('')
TOOL_BIN_FILE+=(gost)

# GoTTY
TOOL_NAME+=('GoTTY')
TOOL_HOMEPAGE+=('https://github.com/sorenisanerd/gotty')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('linux_amd64')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(targz_extractor)
TOOL_BIN_FILE_IN_ARCHIVE+=('./gotty')
TOOL_BIN_FILE+=(gotty)

# GRV
TOOL_NAME+=('GRV')
TOOL_HOMEPAGE+=('https://github.com/rgburke/grv')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('grv.*linux64')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(bin_extractor)
TOOL_BIN_FILE_IN_ARCHIVE+=('linux64')
TOOL_BIN_FILE+=(grv)

# hexyl
TOOL_NAME+=('hexyl')
TOOL_HOMEPAGE+=('https://github.com/sharkdp/hexyl')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('x86_64.*linux.*musl')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(targz_extractor)
# TOOL_BIN_FILE_IN_ARCHIVE+=('hexyl-v0.14.0-x86_64-unknown-linux-musl/hexyl')
TOOL_BIN_FILE_IN_ARCHIVE+=('s|.*/(.*)\.tar\.gz|\1/hexyl|p')
TOOL_BIN_FILE+=(hexyl)

# lazydocker
TOOL_NAME+=('lazydocker')
TOOL_HOMEPAGE+=('https://github.com/jesseduffield/lazydocker')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('Linux.*x86_64')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(targz_extractor)
TOOL_BIN_FILE_IN_ARCHIVE+=('lazydocker')
TOOL_BIN_FILE+=(lazydocker)

# LF
TOOL_NAME+=('LF')
TOOL_HOMEPAGE+=('https://github.com/gokcehan/lf')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('linux.*amd64')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(targz_extractor)
TOOL_BIN_FILE_IN_ARCHIVE+=('lf')
TOOL_BIN_FILE+=(lf)

# lnav
TOOL_NAME+=('lnav')
TOOL_HOMEPAGE+=('https://github.com/tstack/lnav')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('linux-musl-x86_64')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(zipfile_extractor)
# TOOL_BIN_FILE_IN_ARCHIVE+=('lnav-0.12.2/lnav')
TOOL_BIN_FILE_IN_ARCHIVE+=('s|.*/(.*)-linux-musl-x86_64.*|\1/lnav|p')
TOOL_BIN_FILE+=(lnav)

# McFly
TOOL_NAME+=('McFly')
TOOL_HOMEPAGE+=('https://github.com/cantino/mcfly')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('x86_64.*linux')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(targz_extractor)
TOOL_BIN_FILE_IN_ARCHIVE+=('mcfly')
TOOL_BIN_FILE+=(mcfly)

# Ncdu
TOOL_NAME+=('Ncdu')
TOOL_HOMEPAGE+=('https://dev.yorhel.nl/ncdu')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('')
TOOL_DOWNLOAD_URL+=('https://dev.yorhel.nl/download/ncdu-2.4-linux-x86_64.tar.gz')
TOOL_ARCHIVE_PROCESSOR+=(targz_extractor)
TOOL_BIN_FILE_IN_ARCHIVE+=('ncdu')
TOOL_BIN_FILE+=(ncdu)

# procs
TOOL_NAME+=('procs')
TOOL_HOMEPAGE+=('https://github.com/dalance/procs')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('x86_64-linux')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(zip_extractor)
TOOL_BIN_FILE_IN_ARCHIVE+=('procs')
TOOL_BIN_FILE+=(procs)

# ripgrep
TOOL_NAME+=('ripgrep')
TOOL_HOMEPAGE+=('https://github.com/BurntSushi/ripgrep')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('x86_64.*linux.*musl.*gz$')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(targz_extractor)
# TOOL_BIN_FILE_IN_ARCHIVE+=('ripgrep-14.1.0-x86_64-unknown-linux-musl/rg')
TOOL_BIN_FILE_IN_ARCHIVE+=('s|.*/(.*)\.tar\.gz|\1/rg|p')
TOOL_BIN_FILE+=('rg')

# Starship
TOOL_NAME+=('Starship')
TOOL_HOMEPAGE+=('https://github.com/starship/starship')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('x86_64-unknown-linux-musl.tar.gz$')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(targz_extractor)
TOOL_BIN_FILE_IN_ARCHIVE+=('starship')
TOOL_BIN_FILE+=(starship)

# toml-cli
TOOL_NAME+=('toml-cli')
TOOL_HOMEPAGE+=('https://github.com/gnprice/toml-cli')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('x86_64.*linux')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(targz_extractor)
# TOOL_BIN_FILE_IN_ARCHIVE+=('toml-0.2.3-x86_64-linux/toml')
TOOL_BIN_FILE_IN_ARCHIVE+=('s|.*/(.*)\.tar\.gz|\1/toml|p')
TOOL_BIN_FILE+=(toml)

# WebSocat
TOOL_NAME+=('WebSocat')
TOOL_HOMEPAGE+=('https://github.com/vi/websocat')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('websocat.x86_64.*linux')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(bin_extractor)
TOOL_BIN_FILE_IN_ARCHIVE+=('')
TOOL_BIN_FILE+=(websocat)

# yq
TOOL_NAME+=('yq')
TOOL_HOMEPAGE+=('https://github.com/mikefarah/yq')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('linux.*amd64.*tar')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(targz_extractor)
TOOL_BIN_FILE_IN_ARCHIVE+=('./yq_linux_amd64')
TOOL_BIN_FILE+=(yq)

# zellij
TOOL_NAME+=('zellij')
TOOL_HOMEPAGE+=('https://github.com/zellij-org/zellij')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('x86_64.*linux.*musl.*tar*.gz')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(targz_extractor)
TOOL_BIN_FILE_IN_ARCHIVE+=('zellij')
TOOL_BIN_FILE+=(zellij)

# zoxide
TOOL_NAME+=('zoxide')
TOOL_HOMEPAGE+=('https://github.com/ajeetdsouza/zoxide')
TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX+=('x86_64.*linux.*musl')
TOOL_DOWNLOAD_URL+=('')
TOOL_ARCHIVE_PROCESSOR+=(targz_extractor)
TOOL_BIN_FILE_IN_ARCHIVE+=('zoxide')
TOOL_BIN_FILE+=(zoxide)

log() {
    local timestamp
    timestamp=$(gdate '+%Y-%m-%d %H:%M:%S.%3N')
    echo -e "\033[1;92m[$timestamp] [${FUNCNAME[1]}:${BASH_LINENO[0]}]\033[0m" "$@" >&2
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
    curl -fsS "$api_url" | jq -r '.assets[] | .browser_download_url'
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
        echo >&2 "All Dl URLs Command = curl -fsS '$api_url' | jq -r '.assets[] | .browser_download_url'"
        echo >&2 "URL Filter          = ${TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX[i]}"
        local download_url
        download_url=$(grep "${TOOL_DOWNLOAD_URL_FILTER_PATTERN_LINUX[i]}" <<<"$urls")

        echo >&2 "Download Url        = $owner_repo=$download_url"
        echo "$owner_repo=$download_url" >>"$github_download_url_list_file"

        sleep 2
    done
}

# get_all_github_software_download_url

# api_url=$(get_api_url_by_name croc)
# get_download_url "$api_url" #| grep 'x86_64.*linux.*musl'

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

load_github_download_url_list "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/data/github_download_url_list.txt"

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
