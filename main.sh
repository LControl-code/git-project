#!/bin/bash

list_files() {
    local dir="$1"
    local suffix="${2:-}"
    for file in "$dir"/*; do
        local base=$(basename "$file")
        if [ -z "$suffix" ] || [ "${base:0:${#suffix}}" == "$suffix" ]; then
            echo "$base"
        fi
    done
}

print_authors() {
    echo "Author: Adam Stratilík"
}

main() {
    local dir="$1"
    local suffix="$2"

    if [ ! -d "$dir" ]; then
        suffix="$dir"
        dir="."
    fi

    list_files "$dir" "$suffix"
    print_authors
}

main "$@"