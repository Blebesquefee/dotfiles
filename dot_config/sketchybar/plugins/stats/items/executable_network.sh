#! /bin/sh

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

network_down=(
y_offset=-7
icon="$NETWORK_DOWN"
icon.color="$GREEN"
icon.font="$FONT:Bold:10.0"
icon.highlight_color="$BLUE"
)

network_up=(
background.padding_right=-70
y_offset=7
icon="$NETWORK_UP"
icon.color="$GREEN"
icon.font="$FONT:Bold:10.0"
icon.highlight_color="$BLUE"
script="$PLUGINS_DIR/stats/scripts/network.sh"
)

sketchybar  --add item network.down right               \
            --set network.down "${network_down[@]}"     \
            --add item network.up right                 \
            --set network.up "${network_up[@]}"
