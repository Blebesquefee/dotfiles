#! /bin/bash

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

volume=(
  icon=$VOLUME_100
  icon.color=$RED
  padding_left=0
  padding_right=0
  script="$PLUGINS_DIR/volume/scripts/volume.sh"
)

sketchybar -m   --add item      volume right            \
                --set volume    "${volume[@]}"          \
                --subscribe     volume volume_change
