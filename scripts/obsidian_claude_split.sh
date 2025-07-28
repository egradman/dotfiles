#!/bin/bash

tmux split-window -h
tmux send-keys "claude" Enter
tmux select-pane -t 1
tmux send-keys "nvim ." Enter
