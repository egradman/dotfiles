#!/bin/bash

tmux split-window -h
tmux select-pane -t 1
tmux send-keys "$1" Enter
tmux select-pane -t 2
tmux send-keys "$2" Enter

tmux select-pane -t 1
