#!/usr/bin/env zsh

# ! antidote - plugin manager
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load
source "$DOTFILES/zsh/plugins.zsh"

source "$DOTFILES/zsh/smart-source.zsh"

# ! powerlevel10k
smart_source "$(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
smart_source "$HOME/.cache/p10k-instant-prompt-$USER.zsh"

# ! Sourcing configurations
configs=(
    "$DOTFILES/zsh/p10k.zsh"
    "$DOTFILES/zsh/aliases.zsh"
    "$DOTFILES/zsh/cli-tools"
)

for config in "${configs[@]}"; do
    smart_source "$config"
done
