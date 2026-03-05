#!/usr/bin/env zsh

(( $+commands[brew] )) || return 1
eval "$(brew shellenv)"
