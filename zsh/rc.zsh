#!/usr/bin/env zsh
source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}

# ! powerlevel10k
source_if_exists $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
source_if_exists $HOME/.cache/p10k-instant-prompt-$USER.zsh
source_if_exists $DOTFILES/zsh/p10k.zsh

# ! Sourcing configurations
source_if_exists $DOTFILES/zsh/aliases.zsh
