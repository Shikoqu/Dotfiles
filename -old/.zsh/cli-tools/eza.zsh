#!/usr/bin/env zsh

# https://github.com/eza-community/eza

# ? TL;DR
# ? eza is a modern, maintained replacement for the venerable file-listing command-line program `ls`
# ? By deliberately making some decisions differently,
# ?     eza attempts to be a more feature-full, more user-friendly version of `ls`.

alias eza="command eza --color=always --git --icons=always"
alias ls="eza"                                        # ordinary list
alias la="eza -A"                                     # all files
alias lsd="eza -A -D"                                 # only directories
alias ll="eza -A -l --total-size --no-time --no-user" # all files, long format
function tree() { eza --tree -L $1; }                 # tree view with depth passed as argument
