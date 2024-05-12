#!/bin/bash

list_files() {
    local dir="$1"
    for file in "$dir"/*; do
            echo "$(basename "$file")"
    done
}

main() {
    list_files $1
}

main "$@"