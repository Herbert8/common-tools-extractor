#!/usr/bin/env bash

THIS_SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
readonly THIS_SCRIPT_DIR

# shellcheck source=/dev/null
source "$THIS_SCRIPT_DIR/list_processor_lib.sh"

parse_soft_list() {
    local src_list_file=$1
    local dest_list_file=$2

    clear_software_array_list

    # shellcheck source=/dev/null
    source "$src_list_file"

    get_all_github_software_download_url "$dest_list_file"
}


parse_soft_list "$THIS_SCRIPT_DIR/standalone_tool_list_x86_64.env" "$THIS_SCRIPT_DIR/data/github_download_url_list_x86_64_latest.txt"
parse_soft_list "$THIS_SCRIPT_DIR/standalone_tool_list_aarch64.env" "$THIS_SCRIPT_DIR/data/github_download_url_list_aarch64_latest.txt"
