#!/bin/bash

REMOTE=$1

rsync -avz --delete "$HOME/.dotfiles/" "$REMOTE:.dotfiles" \
    --include .dotfiles/tmux \
    --include .dotfiles/nvim \
    --include .dotfiles/zsh \
    --include .dotfiles/direnv \
    --include .dotfiles/scripts \
    --include .dotfiles/oh-my-posh \
    --exclude="*"

tmux setw default-command "$HOME/.dotfiles/scripts/ssh_with_env.sh $1"
$HOME/.dotfiles/scripts/ssh_with_env.sh $1
