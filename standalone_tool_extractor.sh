#!/bin/bash

set -eu
set -o pipefail

# 显示函数 **********************************************************************
# 生成彩色文本
sprint_colored_text () {
    local attrs=''
    [[ "$#" -gt "1" ]] && for (( i=2;i<=$#;i++ )); do
        attrs=${attrs}${!i}';'
    done
    attrs=${attrs%;}
    local msg=${1-}
    echo -n "\033[0;${attrs}m${msg}"
}

# 打印彩色文本
print_colored_text () {
    echo -ne "$(sprint_colored_text "$@")"
}

# 打印彩色文本后换行
println_colored_text () {
    print_colored_text "$@"
    echo
}


# 提取函数 **********************************************************************
# 显示工具名喝 URL 等信息
show_info () {
    local tool_name
    local download_url
    tool_name="$1"
    download_url="$2"
    proj_github_homepage_url=$(echo "$download_url" | sed -nr 's|(^https://github.com/.*)/releases/latest.*|\1|p')
    >&2 echo "Tool: $tool_name"
    >&2 echo "Project Github Homepage: $proj_github_homepage_url"
    >&2 echo "Downloading $download_url ..."
}

# 进行下载
download () {
    local download_url
    download_url="$1"
    # curl -fL --retry 10 "$download_url"
    curl -fL "$download_url"
}

gz_extractor () {
    local tool_name=$1
    local download_url=$2
    # local tool_in_archive=$3
    local tool_bin=$4
    download "$download_url" | zcat > "$TOOLS_PATH/$tool_bin"
}

targz_extractor () {
    local tool_name=$1
    local download_url=$2
    local tool_in_archive=$3
    local tool_bin=$4
    download "$download_url" | tar -zx "$tool_in_archive" -O > "$TOOLS_PATH/$tool_bin"
}

tarbz_extractor () {
    local tool_name=$1
    local download_url=$2
    local tool_in_archive=$3
    local tool_bin=$4
    download "$download_url" | tar -jx "$tool_in_archive" -O > "$TOOLS_PATH/$tool_bin"
}

tarxz_extractor () {
    local tool_name=$1
    local download_url=$2
    local tool_in_archive=$3
    local tool_bin=$4
    download "$download_url" | tar -Jx "$tool_in_archive" -O > "$TOOLS_PATH/$tool_bin"
}

zip_extractor () {
    local tool_name=$1
    local download_url=$2
    local tool_in_archive=$3
    local tool_bin=$4
    download "$download_url" | funzip > "$TOOLS_PATH/$tool_bin"
}

zipfile_extractor () {
    local tool_name=$1
    local download_url=$2
    local tool_in_archive=$3
    local tool_bin=$4
    local zip_file
    zip_file=$(mktemp)
    download "$download_url" > "$zip_file" \
        && unzip -p "$zip_file" "$tool_in_archive" > "$TOOLS_PATH/$tool_bin" \
        && rm "$zip_file"
}

bin_extractor () {
    local tool_name=$1
    local download_url=$2
    local tool_in_archive=$3
    local tool_bin=$4
    download "$download_url" > "$TOOLS_PATH/$tool_bin"
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

# gost
# https://github.com/ginuerzh/gost
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='GO Simple Tunnel'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/ginuerzh/gost/releases/latest/download/gost-linux-amd64-2.11.5.gz'
TOOL_ARCHIVE_PROCESSOR["$idx"]=gz_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]=''
TOOL_BIN_FILE["$idx"]=gost

# croc
# https://github.com/schollz/croc
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='croc'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/schollz/croc/releases/latest/download/croc_9.6.5_Linux-64bit.tar.gz'
TOOL_ARCHIVE_PROCESSOR["$idx"]=targz_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='croc'
TOOL_BIN_FILE["$idx"]=croc



# docker-compose
# 参考 https://docs.docker.com/compose/install/
# compose_url="https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)"
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='Docker Compose'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/docker/compose/releases/latest/download/docker-compose-Linux-x86_64'
TOOL_ARCHIVE_PROCESSOR["$idx"]=bin_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]=''
TOOL_BIN_FILE["$idx"]=docker-compose


# brook
# https://github.com/txthinking/brook
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='Brook'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/txthinking/brook/releases/latest/download/brook_linux_amd64'
TOOL_ARCHIVE_PROCESSOR["$idx"]=bin_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]=''
TOOL_BIN_FILE["$idx"]=brook


# dive
# https://github.com/wagoodman/dive
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='Dive'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/wagoodman/dive/releases/latest/download/dive_0.11.0_linux_amd64.tar.gz'
TOOL_ARCHIVE_PROCESSOR["$idx"]=targz_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='dive'
TOOL_BIN_FILE["$idx"]=dive


# grv
# https://github.com/rgburke/grv
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='GRV'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/rgburke/grv/releases/latest/download/grv_v0.3.2_linux64'
TOOL_ARCHIVE_PROCESSOR["$idx"]=bin_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]=''
TOOL_BIN_FILE["$idx"]=grv


# fzf
# https://github.com/junegunn/fzf
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='fzf'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/junegunn/fzf/releases/latest/download/fzf-0.42.0-linux_amd64.tar.gz'
TOOL_ARCHIVE_PROCESSOR["$idx"]=targz_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='fzf'
TOOL_BIN_FILE["$idx"]=fzf


# webdav
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



# lf
# https://github.com/gokcehan/lf
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='LF'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/gokcehan/lf/releases/latest/download/lf-linux-amd64.tar.gz'
TOOL_ARCHIVE_PROCESSOR["$idx"]=targz_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='lf'
TOOL_BIN_FILE["$idx"]='lf'


# yq
# https://github.com/mikefarah/yq
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='yq'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64.tar.gz'
TOOL_ARCHIVE_PROCESSOR["$idx"]=targz_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='./yq_linux_amd64'
TOOL_BIN_FILE["$idx"]='yq'


# duf
# https://github.com/muesli/duf
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='duf'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/muesli/duf/releases/latest/download/duf_0.8.1_linux_x86_64.tar.gz'
TOOL_ARCHIVE_PROCESSOR["$idx"]=targz_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='duf'
TOOL_BIN_FILE["$idx"]='duf'


# procs
# https://github.com/dalance/procs
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='procs'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/dalance/procs/releases/latest/download/procs-v0.14.1-x86_64-linux.zip'
TOOL_ARCHIVE_PROCESSOR["$idx"]=zip_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='procs'
TOOL_BIN_FILE["$idx"]='procs'


# curlie
# https://github.com/rs/curlie
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='Curlie'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/rs/curlie/releases/latest/download/curlie_1.7.1_linux_amd64.tar.gz'
TOOL_ARCHIVE_PROCESSOR["$idx"]=targz_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='curlie'
TOOL_BIN_FILE["$idx"]='curlie'


# delta
# https://github.com/dandavison/delta
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='delta'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/dandavison/delta/releases/latest/download/delta-0.16.5-x86_64-unknown-linux-musl.tar.gz'
TOOL_ARCHIVE_PROCESSOR["$idx"]=targz_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='delta-0.16.5-x86_64-unknown-linux-musl/delta'
TOOL_BIN_FILE["$idx"]='delta'




# btop
# https://github.com/aristocratos/btop
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='btop'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/aristocratos/btop/releases/latest/download/btop-x86_64-linux-musl.tbz'
TOOL_ARCHIVE_PROCESSOR["$idx"]=tarbz_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='./btop/bin/btop'
TOOL_BIN_FILE["$idx"]='btop'

# ripgrep
# https://github.com/BurntSushi/ripgrep
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='ripgrep'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/BurntSushi/ripgrep/releases/latest/download/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz'
TOOL_ARCHIVE_PROCESSOR["$idx"]=targz_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='ripgrep-13.0.0-x86_64-unknown-linux-musl/rg'
TOOL_BIN_FILE["$idx"]='rg'

# bat
# https://github.com/sharkdp/bat
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='bat'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/sharkdp/bat/releases/latest/download/bat-v0.23.0-x86_64-unknown-linux-musl.tar.gz'
TOOL_ARCHIVE_PROCESSOR["$idx"]=targz_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='bat-v0.23.0-x86_64-unknown-linux-musl/bat'
TOOL_BIN_FILE["$idx"]='bat'

# hexyl
# https://github.com/sharkdp/hexyl
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='hexyl'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/sharkdp/hexyl/releases/latest/download/hexyl-v0.13.1-x86_64-unknown-linux-musl.tar.gz'
TOOL_ARCHIVE_PROCESSOR["$idx"]=targz_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='hexyl-v0.13.1-x86_64-unknown-linux-musl/hexyl'
TOOL_BIN_FILE["$idx"]='hexyl'

# fd
# https://github.com/sharkdp/fd
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='fd'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/sharkdp/fd/releases/latest/download/fd-v8.7.0-x86_64-unknown-linux-musl.tar.gz'
TOOL_ARCHIVE_PROCESSOR["$idx"]=targz_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='fd-v8.7.0-x86_64-unknown-linux-musl/fd'
TOOL_BIN_FILE["$idx"]='fd'

# exa
# https://github.com/ogham/exa
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='exa'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/ogham/exa/releases/latest/download/exa-linux-x86_64-musl-v0.10.1.zip'
TOOL_ARCHIVE_PROCESSOR["$idx"]=zipfile_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='bin/exa'
TOOL_BIN_FILE["$idx"]='exa'

# broot
# https://github.com/Canop/broot
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='Broot'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/Canop/broot/releases/latest/download/broot_1.26.1.zip'
TOOL_ARCHIVE_PROCESSOR["$idx"]=zipfile_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='x86_64-unknown-linux-musl/broot'
TOOL_BIN_FILE["$idx"]='broot'

# bandwhich
# https://github.com/imsnif/bandwhich
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='bandwhich'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/imsnif/bandwhich/releases/latest/download/bandwhich-v0.21.0-x86_64-unknown-linux-musl.tar.gz'
TOOL_ARCHIVE_PROCESSOR["$idx"]=targz_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='bandwhich'
TOOL_BIN_FILE["$idx"]='bandwhich'


# coreutils
# https://github.com/uutils/coreutils
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='uutils coreutils'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/uutils/coreutils/releases/latest/download/coreutils-0.0.21-x86_64-unknown-linux-musl.tar.gz'
TOOL_ARCHIVE_PROCESSOR["$idx"]=targz_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='coreutils-0.0.21-x86_64-unknown-linux-musl/coreutils'
TOOL_BIN_FILE["$idx"]='coreutils'


# zoxide
# https://github.com/ajeetdsouza/zoxide
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='zoxide'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/ajeetdsouza/zoxide/releases/latest/download/zoxide-0.9.2-x86_64-unknown-linux-musl.tar.gz'
TOOL_ARCHIVE_PROCESSOR["$idx"]=targz_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='zoxide'
TOOL_BIN_FILE["$idx"]='zoxide'

# gitui
# https://github.com/extrawurst/gitui
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='GitUI'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/extrawurst/gitui/releases/latest/download/gitui-linux-musl.tar.gz'
TOOL_ARCHIVE_PROCESSOR["$idx"]=targz_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='./gitui'
TOOL_BIN_FILE["$idx"]='gitui'

# fx
# https://github.com/antonmedv/fx
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='fx'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/antonmedv/fx/releases/latest/download/fx_linux_amd64'
TOOL_ARCHIVE_PROCESSOR["$idx"]=bin_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]=''
TOOL_BIN_FILE["$idx"]='fx'

# starship
# https://github.com/starship/starship
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='Starship'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-musl.tar.gz'
TOOL_ARCHIVE_PROCESSOR["$idx"]=targz_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='starship'
TOOL_BIN_FILE["$idx"]='starship'

# WebSocat
# https://github.com/vi/websocat
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='WebSocat'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/vi/websocat/releases/latest/download/websocat_max.x86_64-unknown-linux-musl'
TOOL_ARCHIVE_PROCESSOR["$idx"]=bin_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]=''
TOOL_BIN_FILE["$idx"]=websocat

# gotty
# https://github.com/sorenisanerd/gotty
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='GoTTY'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/sorenisanerd/gotty/releases/latest/download/gotty_v1.5.0_linux_amd64.tar.gz'
TOOL_ARCHIVE_PROCESSOR["$idx"]=targz_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='./gotty'
TOOL_BIN_FILE["$idx"]=gotty

# mcfly
# https://github.com/cantino/mcfly
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='McFly'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/cantino/mcfly/releases/latest/download/mcfly-v0.8.1-x86_64-unknown-linux-musl.tar.gz'
TOOL_ARCHIVE_PROCESSOR["$idx"]=targz_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='mcfly'
TOOL_BIN_FILE["$idx"]=mcfly

# dust
# https://github.com/bootandy/dust
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='Dust'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/bootandy/dust/releases/latest/download/dust-v0.8.6-x86_64-unknown-linux-musl.tar.gz'
TOOL_ARCHIVE_PROCESSOR["$idx"]=targz_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='dust-v0.8.6-x86_64-unknown-linux-musl/dust'
TOOL_BIN_FILE["$idx"]=dust

# ncdu
# https://dev.yorhel.nl/ncdu
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='Ncdu'
TOOL_DOWNLOAD_URL["$idx"]='https://dev.yorhel.nl/download/ncdu-2.2.1-linux-x86_64.tar.gz'
TOOL_ARCHIVE_PROCESSOR["$idx"]=targz_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='ncdu'
TOOL_BIN_FILE["$idx"]=ncdu

# 7zip
# https://www.7-zip.org/
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='7-Zip'
TOOL_DOWNLOAD_URL["$idx"]='https://www.7-zip.org/a/7z2301-linux-x64.tar.xz'
TOOL_ARCHIVE_PROCESSOR["$idx"]=tarxz_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='7zzs'
TOOL_BIN_FILE["$idx"]=7zz

# toml-cli
# https://github.com/gnprice/toml-cli
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='toml-cli'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/gnprice/toml-cli/releases/latest/download/toml-0.2.3-x86_64-linux.tar.gz'
TOOL_ARCHIVE_PROCESSOR["$idx"]=targz_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='toml-0.2.3-x86_64-linux/toml'
TOOL_BIN_FILE["$idx"]=toml

echo
# set -x
# 主程序
# rm -rf "${TOOLS_PATH:?}"/*
tools_count=${#TOOL_NAME[@]}
fail_count=0
for((i=0;i<"$tools_count";i++)); do
    >&2 echo "Index: $(( i + 1 )) / $tools_count - ${TOOL_NAME[$i]}"

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
            fail_count=$(( fail_count + 1 ))
            >&2 print_colored_text "========== Error: Extract '${TOOL_NAME[$i]}' failed! ==========" 31
            >&2 print_colored_text '' 0
        fi

        >&2 echo
        >&2 echo
        >&2 echo
    fi
done

[[ "$fail_count" -eq "0" ]] && rm "${TOOLS_PATH:?}"/*.sum

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
