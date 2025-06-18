#!/usr/bin/env zsh

ETC_ZSHENV="/etc/zshenv"
CONTENT='ZDOTDIR="$HOME/.config/zsh"'

echo "--- /etc/zshenv configuration ---"

# Check if /etc/zshenv exists
if [[ ! -f "$ETC_ZSHENV" ]]; then
    echo "Info: $ETC_ZSHENV does not exist. Creating it and writing configuration."
    echo "$CONTENT" | sudo tee "$ETC_ZSHENV" >/dev/null

    if [[ $? -eq 0 ]]; then
        echo "Success: Created $ETC_ZSHENV with: $CONTENT"
    else
        echo "Error: Failed to create and write to $ETC_ZSHENV"
        exit 1
    fi
else
    echo "Info: $ETC_ZSHENV already exists."

    # Check if the ZDOTDIR variable is configured in the file
    if ! sudo grep -q "ZDOTDIR=" "$ETC_ZSHENV"; then
        echo "Info: ZDOTDIR is not configured in $ETC_ZSHENV. Appending configuration."
        echo "$CONTENT" | sudo tee -a "$ETC_ZSHENV" >/dev/null

        if [[ $? -eq 0 ]]; then
            echo "Success: Appended '$CONTENT' to $ETC_ZSHENV"
        else
            echo "Error: Failed to append to $ETC_ZSHENV"
            exit 1
        fi
    else
        echo "Warning: ZDOTDIR is already configured in $ETC_ZSHENV."
        echo "Current ZDOTDIR line(s) in $ETC_ZSHENV:"
        sudo grep "ZDOTDIR=" "$ETC_ZSHENV"

        echo ""
        echo "Please manually review and modify $ETC_ZSHENV if you wish to change its value."
        echo "The desired line is: $CONTENT"
    fi
fi

echo "--- Script Finished ---"
