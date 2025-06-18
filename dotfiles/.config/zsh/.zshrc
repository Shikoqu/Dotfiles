#!/usr/bin/env zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load $DOTFILES/zsh/.plugins.txt

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/config/p10k.zsh.
[[ ! -f ~/.dotfiles/config/p10k.zsh ]] || source ~/.dotfiles/config/p10k.zsh
