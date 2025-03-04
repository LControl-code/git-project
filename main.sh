#!/bin/bash

list_files() {
    local dir="$1"
    local suffix="${2:-}"
    local recurse="${3:-false}"
    for file in "$dir"/*; do
        if [ -f "$file" ]; then
            local base=$(basename "$file")
            if [ -z "$suffix" ] || [ "${base:0:${#suffix}}" == "$suffix" ]; then
                echo "$(realpath "$file")"
            fi
        elif [ "$recurse" = true ] && [ -d "$file" ]; then
            list_files "$file" "$suffix" "$recurse"
        fi
    done
}

print_authors() {
    echo "Author: Adam Stratilík"
}

main() {
    local dir="."
    local suffix=""
    local recurse="false"

    for arg in "$@"; do
        if [ -d "$arg" ]; then
            dir="$arg"
        elif [ "$arg" = true ] || [ "$arg" = false ]; then
            recurse="$arg"
        else
            suffix="$arg"
        fi
    done

    list_files "$dir" "$suffix" "$recurse"
    print_authors


    echo
    echo "Testovacia časť:"
    echo "Test 1: Bez suffixu, bez rekurzie:"
    list_files "." "" false
    echo

    echo "Test 2: Bez suffixu, s rekurziou:"
    list_files "." "" true
    echo

    echo "Test 3: So suffixom 'ma', bez rekurzie:"
    list_files "." "ma" false
    echo

    echo "Test 4: So suffixom 'ma', s rekurziou:"
    list_files "." "ma" true

}

main "$@"