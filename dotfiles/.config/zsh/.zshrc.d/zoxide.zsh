#!/usr/bin/env zsh

(( $+commands[zoxide] )) || return 1
eval "$(zoxide init --cmd cd zsh)"
