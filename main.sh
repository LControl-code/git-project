#!/bin/bash

list_files() {
    local dir="$1"
    for file in "$dir"/*; do
            echo "$(basename "$file")"
    done
}

print_authors() {
    echo "Author: Adam Stratilík"
}

main() {
    list_files $1
    print_authors
}

main "$@"