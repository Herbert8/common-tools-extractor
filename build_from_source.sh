#!/usr/bin/env bash

build_httpstat_from_source() {
    local target_dir=$1
    local work_dir
    work_dir=$(mktemp -d) || return

    git clone 'git@github.com:davecheney/httpstat.git' "$work_dir" &&
        (
            local ver
            cd "$work_dir" &&
                ver=$(git describe --tags "$(git rev-list --tags --max-count=1)") &&
                gmake -e VERSION="$ver" release &&
                chmod -x "$work_dir"/httpstat-linux-amd64-* &&
                cp "$work_dir"/httpstat-linux-amd64-* "$target_dir/httpstat" &&
                cd "$work_dir"/.. &&
                rm -rf "$work_dir"
        )
}

build_httpbingo_from_source() {
    local target_dir=$1
    local work_dir
    work_dir=$(mktemp -d) || return

    git clone 'git@github.com:Herbert8/httpbingo.git' "$work_dir" &&
        (
            local script_dir=$work_dir/scripts
            cd "$script_dir" &&
                bash release.sh &&
                chmod -x "$script_dir/dist/httpbingo_linux_amd64" &&
                cp "$script_dir/dist/httpbingo_linux_amd64" "$target_dir/httpbingo" &&
                cd "$work_dir"/.. &&
                rm -rf "$work_dir"
        )
}

main() {
    # 避免每次输入密码
    eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_rsa
    # 构建 httpstat
    build_httpstat_from_source "$1"
    # 构建 httpbingo
    build_httpbingo_from_source "$1"
}

main "$@"
