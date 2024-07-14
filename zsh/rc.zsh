#!/usr/bin/env zsh

# Initialize starship
[[ -f ~/.dotfiles/zsh/starship/def-distro.zsh ]] && source ~/.dotfiles/zsh/starship/def-distro.zsh
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.dotfiles/zsh/starship/config.toml
