#!/usr/bin/env bash

COLOR="$YELLOW"

sketchybar \
	--add item keyboard right \
	--set keyboard \
    script="$PLUGIN_DIR/get_karabiner_profile.py" \
    click_script="$PLUGIN_DIR/switch_karabiner_profile.py" \
	update_freq=3 \
	icon.color="$COLOR" \
	icon.padding_left=10 \
	label.color="$COLOR" \
	label.padding_right=10 \
	background.height=26 \
	background.corner_radius="$CORNER_RADIUS" \
	background.padding_right=5 \
	background.border_width="$BORDER_WIDTH" \
	background.border_color="$COLOR" \
	background.color="$BAR_COLOR" \
	background.drawing=on \
