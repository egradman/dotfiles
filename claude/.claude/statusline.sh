#!/bin/bash

# Read JSON input from stdin
input=$(cat)

# Extract values using jq
MODEL=$(echo "$input" | jq -r '.model.display_name')
CONTEXT_USED=$(echo "$input" | jq -r '.context_window.used_percentage // 0')

# Get git branch if in a git repo
GIT_BRANCH=""
if git rev-parse --git-dir > /dev/null 2>&1; then
    BRANCH=$(git branch --show-current 2>/dev/null)
    if [ -n "$BRANCH" ]; then
        GIT_BRANCH=" | git:$BRANCH"
    fi
fi

# Format context bar
CONTEXT_BAR=""
if [ "$CONTEXT_USED" != "null" ]; then
    PERCENT=$(printf "%.0f" "$CONTEXT_USED")
    SEGMENTS=$((PERCENT / 10))
    BAR=$(printf '%0.s█' $(seq 1 $SEGMENTS))
    EMPTY=$(printf '%0.s░' $(seq 1 $((10 - SEGMENTS))))
    CONTEXT_BAR=" | ctx:${BAR}${EMPTY} ${PERCENT}%"
fi

echo "[$MODEL]$CONTEXT_BAR$GIT_BRANCH"
