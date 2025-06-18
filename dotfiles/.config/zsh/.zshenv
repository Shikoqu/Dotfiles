#!/usr/bin/env zsh

# XDG
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-$HOME/.xdg}

# uv
export PATH="/Users/jakubwadrzyk/.local/bin:$PATH"

# npm
export NPM_CONFIG_INIT_MODULE="$XDG_CONFIG_HOME"/npm/config/npm-init.js
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME"/npm
export NPM_CONFIG_TMP="$XDG_RUNTIME_DIR"/npm

# rust
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
