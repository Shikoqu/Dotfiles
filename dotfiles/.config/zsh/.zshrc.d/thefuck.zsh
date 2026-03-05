#!/usr/bin/env zsh

(( $+commands[thefuck] )) || return 1
eval "$(thefuck --alias fk)"
# eval $(thefuck --yeah --alias fky) # how to configure alias with given flag
