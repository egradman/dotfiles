#!/usr/bin/env bash

COLOR="$BLUE"

sketchybar \
	--add item ip left \
	--set ip script="$PLUGIN_DIR/ip.py" \
	--set ip update_freq=10 \
	icon.drawing=off \
	background.height=26 \
	background.padding_left=0 \
	background.padding_right=10 \
	background.border_width="$BORDER_WIDTH" \
	background.border_color="$COLOR" \
	background.corner_radius="$CORNER_RADIUS" \
	background.color="$BAR_COLOR" \
	label.color="$COLOR" \
	label.padding_left=10 \
	label.padding_right=10 \
	associated_display=active \
