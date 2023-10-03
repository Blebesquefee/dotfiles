#! /bin/sh

source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

HEADSET="WH-1000XM4"

bluetooth=(
    icon=$BLUETOOTH
    padding_left=0
    padding_right=0
    update_script=5
    script="$PLUGINS_DIR/bluetooth/scripts/bluetooth.sh"
    click_script="$PLUGINS_DIR/bluetooth/scripts/bluetooth_click.sh $HEADSET"
)

sketchybar  --add item      bluetooth   right           \
            --set bluetooth "${bluetooth[@]}"           \
            --subscribe     bluetooth   mouse.clicked   \
                                        mouse.entered   \
                                        mouse.exited
