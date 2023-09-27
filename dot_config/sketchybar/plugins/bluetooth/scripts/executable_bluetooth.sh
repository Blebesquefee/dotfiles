#! /bin/sh

source "$CONFIG_DIR/colors.sh"

STATE=$(blueutil --is-connect 28-11-a5-77-8a-80)
COLOR="$GREY"
LABEL=""

if [ "$STATE" = "0" ]; then
    COLOR="$GREY"
    LABEL="N/A"
else
    COLOR="$BLUE"
    LABEL="QC35II"
fi

sketchybar --set $NAME icon.color=$COLOR label="$LABEL"
