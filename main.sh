#!/bin/bash

list_files() {
    local dir="$1"
    local recurse="${2:-false}"
    for file in "$dir"/*; do
        if [ -f "$file" ]; then
            echo "$(realpath "$file")"
        elif [ "$recurse" = true ] && [ -d "$file" ]; then
            list_files "$file" "$recurse"
        fi
    done
}

main() {
    local dir="$1"
    local recurse="$2"

    if [ ! -d "$dir" ]; then
        recurse="$dir"
        dir="."
    fi

    list_files "$dir" "$recurse"
}

main "$@"