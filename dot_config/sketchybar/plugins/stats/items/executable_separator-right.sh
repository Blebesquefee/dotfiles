#! /bin/sh

source "$CONFIG_DIR/icons.sh"

separator_right=(
icon=$SEPARATOR_LEFT
background.padding_left=10
background.padding_right=10
label.drawing=off
click_script='sketchybar --trigger toggle_stats'
)

sketchybar  --add item separator_right right \
            --set separator_right "${separator_right[@]}"
