#!/usr/bin/env bash

COLOR="$YELLOW"

sketchybar --add item smile right \
	--set smile update_freq=1 \
	icon.color="$COLOR" \
	icon.font="$FONT:Bold:24" \
    icon.scale=4.0 \
	background.drawing=off \
	script="$PLUGIN_DIR/smile.sh"
