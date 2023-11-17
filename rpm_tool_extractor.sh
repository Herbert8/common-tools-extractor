#!/bin/bash

set -eu
set -o pipefail

# 显示工具名喝 URL 等信息
show_info () {
    local tool_name
    local download_url
    tool_name="$1"
    download_url="$2"
    >&2 echo "Tool: $tool_name"
    >&2 echo "Downloading $download_url ..."
}

# 进行下载
download () {
    local download_url
    download_url="$1"
    curl -fL --retry 10 "$download_url"
}

rpm_downloader () {
    local tool_name=$1
    local download_url=$2
    show_info "$tool_name" "$download_url"
    local rpm_file_name=$WORK_DIR/${tool_name}.rpm
    download "$download_url" > "$rpm_file_name"
}

gen_checksum () {
    (
        local filename=$1
        cd "$TOOLS_PATH" && sha256sum -b "$filename" > "${filename}.sum"
    )
}


check_sum () {
    (
        local sum_file_name=$1.sum
        cd "$TOOLS_PATH" && {
            [[ ! -f "$sum_file_name" ]] && return 1
            sha256sum -c "$sum_file_name"
        }
    )
}


# 指定安装到的位置
TOOLS_PATH="$1"

if [[ ! -d "$TOOLS_PATH" ]]; then
    echo Destination folder does not exist.
    exit 1
fi

TOOLS_PATH=$(cd "$TOOLS_PATH" && pwd)
readonly

echo

echo "RPM Tools will be save to '$TOOLS_PATH'"

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
# TOOL_ARCHIVE_PROCESSOR=()
# TOOL_BIN_FILE_IN_ARCHIVE=()
# TOOL_BIN_FILE=()

# rpm 下载地址
# https://rpmfind.net/



# hstr
idx=${#TOOL_NAME[@]}
TOOL_NAME[$idx]='hstr'
TOOL_DOWNLOAD_URL[$idx]='https://rpmfind.net/linux/epel/7/x86_64/Packages/h/hstr-1.19-1.el7.x86_64.rpm'

# htop
idx=${#TOOL_NAME[@]}
TOOL_NAME[$idx]='htop'
TOOL_DOWNLOAD_URL[$idx]='https://rpmfind.net/linux/epel/7/x86_64/Packages/h/htop-2.2.0-3.el7.x86_64.rpm'

# ncdu
idx=${#TOOL_NAME[@]}
TOOL_NAME[$idx]='ncdu'
TOOL_DOWNLOAD_URL[$idx]='https://rpmfind.net/linux/epel/7/x86_64/Packages/n/ncdu-1.17-1.el7.x86_64.rpm'

# socat
idx=${#TOOL_NAME[@]}
TOOL_NAME[$idx]='socat'
TOOL_DOWNLOAD_URL[$idx]='https://rpmfind.net/linux/centos/7.9.2009/os/x86_64/Packages/socat-1.7.3.2-2.el7.x86_64.rpm'

# the_silver_searcher
idx=${#TOOL_NAME[@]}
TOOL_NAME[$idx]='ag'
TOOL_DOWNLOAD_URL[$idx]='https://rpmfind.net/linux/epel/7/x86_64/Packages/t/the_silver_searcher-2.1.0-1.el7.x86_64.rpm'

# traceroute
idx=${#TOOL_NAME[@]}
TOOL_NAME[$idx]='traceroute'
TOOL_DOWNLOAD_URL[$idx]='https://rpmfind.net/linux/centos/7.9.2009/os/x86_64/Packages/traceroute-2.0.22-2.el7.x86_64.rpm'

# zstd
idx=${#TOOL_NAME[@]}
TOOL_NAME[$idx]='zstd'
TOOL_DOWNLOAD_URL[$idx]='https://rpmfind.net/linux/epel/7/x86_64/Packages/z/zstd-1.5.2-1.el7.x86_64.rpm'



# BASE_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
# readonly BASE_DIR

WORK_DIR=$(mktemp -d)
readonly WORK_DIR

echo
# set -x
# 主程序
# rm -rf "${TOOLS_PATH:?}"/*
tools_count=${#TOOL_NAME[@]}
for((i=0;i<"$tools_count";i++)); do

    >&2 echo "Index: $(( i + 1 )) / $tools_count - ${TOOL_NAME[$i]}"

    rpm_downloader "${TOOL_NAME[$i]}" "${TOOL_DOWNLOAD_URL[$i]}"

done

cd "$WORK_DIR"

for rpm_file in "$WORK_DIR"/*.rpm; do
    rpm2cpio "$rpm_file" | cpio -div
done

cp "$WORK_DIR/usr/bin"/* "$TOOLS_PATH"/

rm -rf "$WORK_DIR"
