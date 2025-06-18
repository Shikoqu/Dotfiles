#!/usr/bin/env zsh

source_if_exists () {
    if [[ -f $1 ]]; then
        source "$1"
        return 0
    else
        return 1
    fi
}

smart_source() {
    if [[ -d "$1" ]]; then
        local init_file="$1/__init__.zsh"
        source_if_exists "$init_file" || echo "Directory $1 does not contain __init__.zsh"
    else
        source_if_exists "$1" || echo "File or directory $1 does not exist"
    fi
}
