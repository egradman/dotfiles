#!/bin/bash
set -e

cd "$(dirname "$0")"

# Packages to stow (directories that contain dotfiles)
packages=(
    direnv
    gh
    ghostty
    git
    karabiner
    nvim
    oh-my-posh
    sesh
    ssh
    tmux
    zsh
)

# macOS-only packages
if [[ "$OSTYPE" == "darwin"* ]]; then
    packages+=(raycast)
fi

echo "Stowing packages..."
for pkg in "${packages[@]}"; do
    if [[ -d "$pkg" ]]; then
        echo "  $pkg"
        stow -R "$pkg"
    fi
done

echo "Done."
