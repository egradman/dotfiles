#!/usr/bin/env bash
[ -n "$TMUX" ] && tmux select-pane -P 'bg=#000040'
[ -f /System/Library/Sounds/Funk.aiff ] && afplay /System/Library/Sounds/Funk.aiff &
exit 0
