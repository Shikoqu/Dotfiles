#!/usr/bin/env zsh

TOOLS_DIR=$(cd $(dirname $0) && pwd)
THIS_FILE=$TOOLS_DIR/$(basename $0)


source_setup_files() {
    for file in "$TOOLS_DIR"/*.zsh; do
        # Exclude the current script from being sourced to prevent infinite recursion
        if [ $file != $THIS_FILE ] && [ -r $file ]; then
            # echo "Loading $file"
            source $file
        fi
    done
}

source_setup_files
