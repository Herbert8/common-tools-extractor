#!/usr/bin/env bash

THIS_SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
readonly THIS_SCRIPT_DIR

SOFTWARE_LIST=$THIS_SCRIPT_DIR/standalone_tool_list.sh
readonly SOFTWARE_LIST

[[ -r "$SOFTWARE_LIST" ]] && source "$SOFTWARE_LIST"

get_all_github_software_download_url "$THIS_SCRIPT_DIR/data/github_download_url_list_latest.txt"
