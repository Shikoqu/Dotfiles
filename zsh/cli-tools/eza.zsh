#!/usr/bin/env zsh

# ! Eza (better ls)
alias eza="command eza --color=always --git --icons=always"
alias ls="eza"                                        # ordinary list
alias la="eza -A"                                     # all files
alias lsd="eza -A -D"                                 # only directories
alias ll="eza -A -l --total-size --no-time --no-user" # all files, long format
function tree() { eza --tree -L $1 ;}                 # tree view with depth passed as argument
