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

# Format context bar with color coding
# Auto-compact triggers at 80%, so we scale that to 100% for display
COMPACT_THRESHOLD=80
CONTEXT_BAR=""
if [ "$CONTEXT_USED" != "null" ]; then
    RAW_PERCENT=$(printf "%.0f" "$CONTEXT_USED")
    # Scale so that 80% actual = 100% displayed
    PERCENT=$((RAW_PERCENT * 100 / COMPACT_THRESHOLD))
    if [ "$PERCENT" -gt 100 ]; then PERCENT=100; fi

    SEGMENTS=$((PERCENT / 10))
    BAR=$(printf '%0.s█' $(seq 1 $SEGMENTS))
    EMPTY=$(printf '%0.s░' $(seq 1 $((10 - SEGMENTS))))

    # Color based on scaled usage: green <50%, yellow <90%, red >=90%
    if [ "$PERCENT" -lt 50 ]; then
        COLOR="\033[38;2;0;220;0m"  # saturated green
    elif [ "$PERCENT" -lt 90 ]; then
        COLOR="\033[33m"  # yellow
    else
        COLOR="\033[31m"  # red
    fi
    RESET="\033[0m"

    CONTEXT_BAR=" | ctx:${COLOR}${BAR}${EMPTY} ${PERCENT}%${RESET}"
fi

echo -e "[$MODEL]$CONTEXT_BAR$GIT_BRANCH"
