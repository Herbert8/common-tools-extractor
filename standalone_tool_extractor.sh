#!/bin/bash

set -eu
set -o pipefail

base_dir() {
    (cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
}

# 显示函数 **********************************************************************
# 生成彩色文本
sprint_colored_text() {
    local attrs=''
    [[ "$#" -gt "1" ]] && for ((i = 2; i <= $#; i++)); do
        attrs=${attrs}${!i}';'
    done
    attrs=${attrs%;}
    local msg=${1-}
    echo -n "\033[0;${attrs}m${msg}"
}

# 打印彩色文本
print_colored_text() {
    echo -ne "$(sprint_colored_text "$@")"
}

# 打印彩色文本后换行
println_colored_text() {
    print_colored_text "$@"
    echo
}

# 提取函数 **********************************************************************
# 显示工具名喝 URL 等信息
show_info() {
    local tool_name
    local download_url
    tool_name="$1"
    download_url="$2"
    proj_github_homepage_url=$(echo "$download_url" | sed -nr 's|(^https://github.com/.*)/releases/latest.*|\1|p')
    echo >&2 "Tool: $tool_name"
    echo >&2 "Project Github Homepage: $proj_github_homepage_url"
    echo >&2 "Downloading $download_url ..."
}

# 进行下载
download() {
    local download_url
    download_url="$1"
    # 判断 url 是否以 / 开头
    # 如果以 / 开头，当做本地文件处理
    # 否则当做网络资源处理
    if [[ "$download_url" == /* ]]; then
        cat "$download_url"
    else
        curl -fL "$download_url"
    fi
}

gz_extractor() {
    local tool_name=$1
    local download_url=$2
    # local tool_in_archive=$3
    local tool_bin=$4
    download "$download_url" | zcat >"$TOOLS_PATH/$tool_bin"
}

targz_extractor() {
    local tool_name=$1
    local download_url=$2
    local tool_in_archive=$3
    local tool_bin=$4
    download "$download_url" | tar -zx "$tool_in_archive" -O >"$TOOLS_PATH/$tool_bin"
}

tarbz_extractor() {
    local tool_name=$1
    local download_url=$2
    local tool_in_archive=$3
    local tool_bin=$4
    download "$download_url" | tar -jx "$tool_in_archive" -O >"$TOOLS_PATH/$tool_bin"
}

tarxz_extractor() {
    local tool_name=$1
    local download_url=$2
    local tool_in_archive=$3
    local tool_bin=$4
    download "$download_url" | tar -Jx "$tool_in_archive" -O >"$TOOLS_PATH/$tool_bin"
}

zip_extractor() {
    local tool_name=$1
    local download_url=$2
    local tool_in_archive=$3
    local tool_bin=$4
    download "$download_url" | funzip >"$TOOLS_PATH/$tool_bin"
}

zipfile_extractor() {
    local tool_name=$1
    local download_url=$2
    local tool_in_archive=$3
    local tool_bin=$4
    local zip_file
    zip_file=$(mktemp)
    download "$download_url" >"$zip_file" &&
        unzip -p "$zip_file" "$tool_in_archive" >"$TOOLS_PATH/$tool_bin" &&
        rm "$zip_file"
}

bin_extractor() {
    local tool_name=$1
    local download_url=$2
    local tool_in_archive=$3
    local tool_bin=$4
    download "$download_url" >"$TOOLS_PATH/$tool_bin"
}

gen_checksum() {
    (
        local filename=$1
        cd "$TOOLS_PATH" && sha256sum -b "$filename" >"${filename}.sum"
    )
}

check_sum() {
    (
        local sum_file_name=$1.sum
        cd "$TOOLS_PATH" && {
            [[ ! -f "$sum_file_name" ]] && return 1
            sha256sum -c "$sum_file_name"
        }
    )
}

run_extract() {
    echo
    # 主程序
    # rm -rf "${TOOLS_PATH:?}"/*
    local tools_count=${#TOOL_NAME[@]}
    readonly tools_count
    local fail_count=0
    for ((i = 0; i < "$tools_count"; i++)); do
        echo >&2 "Index: $((i + 1)) / $tools_count - ${TOOL_NAME[$i]}"

        # 检查 checksum，不通过则下载
        if ! check_sum "${TOOL_BIN_FILE[$i]}"; then

            show_info "${TOOL_NAME[$i]}" "${TOOL_DOWNLOAD_URL[$i]}"

            if "${TOOL_ARCHIVE_PROCESSOR[$i]}" \
                "${TOOL_NAME[$i]}" \
                "${TOOL_DOWNLOAD_URL[$i]}" \
                "${TOOL_BIN_FILE_IN_ARCHIVE[$i]}" \
                "${TOOL_BIN_FILE[$i]}"; then
                gen_checksum "${TOOL_BIN_FILE[$i]}"
            else
                fail_count=$((fail_count + 1))
                print_colored_text >&2 "========== Error: Extract '${TOOL_NAME[$i]}' failed! ==========" 31
                print_colored_text >&2 '' 0
            fi

            echo >&2
            echo >&2
            echo >&2
        fi
    done

    [[ "$fail_count" -eq "0" ]] && rm "${TOOLS_PATH:?}"/*.sum
}

download_with_aria2() {
    echo
    # 下载列表
    local download_list_file
    download_list_file=$(base_dir)/download_list.txt
    : >"$download_list_file"
    # 临时下载文件夹
    local tmp_download_dir
    tmp_download_dir=$(base_dir)/tmp_download
    mkdir -p "$tmp_download_dir" || exit 1

    # 下载软件数量
    local tools_count=${#TOOL_NAME[@]}
    readonly tools_count

    # 遍历生成下载文件列表
    for ((i = 0; i < "$tools_count"; i++)); do
        echo "${TOOL_DOWNLOAD_URL[$i]}" >>"$download_list_file"
        TOOL_DOWNLOAD_URL[i]=$tmp_download_dir/$(basename "${TOOL_DOWNLOAD_URL[i]}")
    done

    all_proxy='' ALL_PROXY='' aria2c --console-log-level=error -c true -d "$tmp_download_dir" -i "$download_list_file"

}

main() {
    # 指定安装到的位置
    TOOLS_PATH="$1"

    if [[ ! -d "$TOOLS_PATH" ]]; then
        echo Destination folder does not exist.
        exit 1
    fi

    TOOLS_PATH=$(cd "$TOOLS_PATH" && pwd)
    readonly TOOLS_PATH

    echo

    echo "Tools will be save to '$TOOLS_PATH'"

    # 显示使用的代理信息
    echo
    echo 'System proxy config:'
    echo "\$http_proxy = ${http_proxy-}"
    echo "\$https_proxy = ${https_proxy-}"
    echo "\$no_proxy = ${no_proxy-}"

    # 创建目录
    mkdir -p "$TOOLS_PATH"

    TOOL_NAME=()
    TOOL_DOWNLOAD_URL=()
    TOOL_ARCHIVE_PROCESSOR=()
    TOOL_BIN_FILE_IN_ARCHIVE=()
    TOOL_BIN_FILE=()

    # 加载软件列表
    echo "$(base_dir)/standalone_tool_list.sh"
    source "$(base_dir)/standalone_tool_list.sh"

    if command -v aria2c >/dev/null; then
        download_with_aria2
    fi

    run_extract

}

main "$@"
