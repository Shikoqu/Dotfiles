#!/usr/bin/env zsh

(( $+commands[bat] )) || return 1
alias cat='bat --paging=never'
