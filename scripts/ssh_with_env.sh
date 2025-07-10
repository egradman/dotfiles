#!/bin/bash
REMOTE=$1

# 1. Rsync the directory to remote

# 2. SSH with environment variables set
ssh -t -A "$REMOTE" "export XDG_CONFIG_HOME=\$HOME/.dotfiles; export ZDOTDIR=\$HOME/.dotfiles/zsh; exec \$SHELL -l"
