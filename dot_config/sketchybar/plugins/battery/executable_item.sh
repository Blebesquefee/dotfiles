#! /bin/sh

source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

battery=(
    icon=$BATTERY_100
    padding_left=0
    padding_right=0
    update_freq=60
    script="$PLUGINS_DIR/battery/scripts/battery.sh"
)

sketchybar -m   --add item      battery right   \
                --set battery   "${battery[@]}" \
                --subscribe battery power_source_change \
                                    system_woke
