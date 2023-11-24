
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
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/schollz/croc/releases/latest/download/croc_9.6.6_Linux-64bit.tar.gz'
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


# lazydocker
# https://github.com/jesseduffield/lazydocker
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='lazydocker'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/jesseduffield/lazydocker/releases/latest/download/lazydocker_0.23.1_Linux_x86_64.tar.gz'
TOOL_ARCHIVE_PROCESSOR["$idx"]=targz_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='lazydocker'
TOOL_BIN_FILE["$idx"]=lazydocker


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
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/junegunn/fzf/releases/latest/download/fzf-0.44.1-linux_amd64.tar.gz'
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
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/dalance/procs/releases/latest/download/procs-v0.14.4-x86_64-linux.zip'
TOOL_ARCHIVE_PROCESSOR["$idx"]=zip_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='procs'
TOOL_BIN_FILE["$idx"]='procs'


# curlie
# https://github.com/rs/curlie
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='Curlie'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/rs/curlie/releases/latest/download/curlie_1.7.2_linux_amd64.tar.gz'
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
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/sharkdp/bat/releases/latest/download/bat-v0.24.0-x86_64-unknown-linux-musl.tar.gz'
TOOL_ARCHIVE_PROCESSOR["$idx"]=targz_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='bat-v0.24.0-x86_64-unknown-linux-musl/bat'
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
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/sharkdp/fd/releases/latest/download/fd-v8.7.1-x86_64-unknown-linux-musl.tar.gz'
TOOL_ARCHIVE_PROCESSOR["$idx"]=targz_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='fd-v8.7.1-x86_64-unknown-linux-musl/fd'
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
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/Canop/broot/releases/latest/download/broot_1.29.0.zip'
TOOL_ARCHIVE_PROCESSOR["$idx"]=zipfile_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='x86_64-unknown-linux-musl/broot'
TOOL_BIN_FILE["$idx"]='broot'

# bandwhich
# https://github.com/imsnif/bandwhich
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='bandwhich'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/imsnif/bandwhich/releases/latest/download/bandwhich-v0.21.1-x86_64-unknown-linux-musl.tar.gz'
TOOL_ARCHIVE_PROCESSOR["$idx"]=targz_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='bandwhich'
TOOL_BIN_FILE["$idx"]='bandwhich'


# coreutils
# https://github.com/uutils/coreutils
idx=${#TOOL_NAME[@]}
TOOL_NAME["$idx"]='uutils coreutils'
TOOL_DOWNLOAD_URL["$idx"]='https://github.com/uutils/coreutils/releases/latest/download/coreutils-0.0.23-x86_64-unknown-linux-musl.tar.gz'
TOOL_ARCHIVE_PROCESSOR["$idx"]=targz_extractor
TOOL_BIN_FILE_IN_ARCHIVE["$idx"]='coreutils-0.0.23-x86_64-unknown-linux-musl/coreutils'
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
TOOL_DOWNLOAD_URL["$idx"]='https://dev.yorhel.nl/download/ncdu-2.3-linux-x86_64.tar.gz'
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
