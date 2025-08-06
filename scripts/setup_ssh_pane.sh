#!/bin/bash

REMOTE=$1

rsync -avz --delete "$HOME/.dotfiles/" "$REMOTE:.dotfiles" \
    --include "tmux/" \
    --include "tmux/***" \
    --include "nvim/" \
    --include "nvim/***" \
    --include "zsh/" \
    --include "zsh/***" \
    --include "direnv/" \
    --include "direnv/***" \
    --include "scripts/" \
    --include "scripts/***" \
    --include "oh-my-posh/" \
    --include "oh-my-posh/***" \
    --include "claude/" \
    --include "claude/commands/" \
    --include "claude/commands/***" \
    --exclude="*" 

tmux setw default-command "$HOME/.dotfiles/scripts/ssh_with_env.sh $1"
$HOME/.dotfiles/scripts/ssh_with_env.sh $1
