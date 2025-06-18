symlink-2-dotfiles() {
    if [[ $# -lt 1 || $# -gt 2 ]]; then
        echo "Usage: symlink-2-dotfiles [source] [target-name (optional)]"
        return 1
    fi

    local src="$(realpath "$1")"
    local name="${2:-$(basename "$src")}"
    local target

    if [[ ! -e "$src" ]]; then
        echo "Error: Source '$src' does not exist."
        return 1
    fi

    local stow_dir="$DOTFILES/dotfiles"
    read "answer?Enter subdirectory to use inside '$stow_dir' (empty for default): "
    if [[ -n "$answer" ]]; then
        echo "Using subdirectory: $answer"
        stow_dir="$stow_dir/$answer"
    fi
    target="$stow_dir/$name"

    # Ensure parent directory exists
    mkdir -p "$(dirname "$target")"

    # Remove existing symlink or file
    if [[ -e "$target" || -L "$target" ]]; then
        rm -rf "$target"
    fi

    # Create relative symlink
    local rel_src
    rel_src=$(perl -MFile::Spec -e 'print File::Spec->abs2rel($ARGV[0], $ARGV[1])' "$src" "$(dirname "$target")")

    ln -s "$rel_src" "$target"
    echo "Symlink created: ${target#$DOTFILES/} -> $rel_src"
}
