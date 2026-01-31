#!/bin/bash

input=$(cat)
MODEL=$(echo "$input" | jq -r '.model.display_name')
PERCENT=$(printf "%.0f" "$(echo "$input" | jq -r '.context_window.used_percentage // 0')")

# Git branch
GIT_BRANCH=""
BRANCH=$(git branch --show-current 2>/dev/null) && [ -n "$BRANCH" ] && GIT_BRANCH=" | git:$BRANCH"

# Context bar: 20 segments, marker at 78% (segment 16), red starts at 58%
RESET="\033[0m"
if [ "$PERCENT" -lt 40 ]; then COLOR="\033[38;2;0;220;0m"
elif [ "$PERCENT" -lt 58 ]; then COLOR="\033[33m"
else COLOR="\033[31m"
fi

FILLED=$((PERCENT * 20 / 100))
[ "$FILLED" -gt 20 ] && FILLED=20
MARKER_POS=16  # 78% autocompaction threshold (22.5% buffer)

BAR=""
for i in $(seq 1 20); do
    if [ "$i" -eq "$MARKER_POS" ]; then
        BAR="${BAR}|"
    elif [ "$i" -le "$FILLED" ]; then
        BAR="${BAR}█"
    else
        BAR="${BAR}░"
    fi
done

echo -e "[$MODEL] | ctx:${COLOR}${BAR} ${PERCENT}%${RESET}$GIT_BRANCH"
