#!/usr/bin/env zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lazy-load (autoload) Zsh function files from a directory.
ZFUNCDIR=${ZDOTDIR:-$HOME}/.zfunctions
fpath=($ZFUNCDIR $fpath)
autoload -Uz $ZFUNCDIR/*(.:t)

[[ ! -f ${ZDOTDIR:-$HOME}/.zstyles ]] || source ${ZDOTDIR:-$HOME}/.zstyles

source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load

load-zshrc-d

# Restore FZF Key bindings
zvm_after_init() {
  source "$(antidote home)/junegunn/fzf/shell/completion.zsh"
  source "$(antidote home)/junegunn/fzf/shell/key-bindings.zsh"
}

# To customize prompt, run `p10k configure` or directly edit the file
[[ ! -f ${ZDOTDIR:-~}/p10k.zsh ]] || source ${ZDOTDIR:-~}/p10k.zsh
