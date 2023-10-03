#! /bin/sh

source "$CONFIG_DIR/colors.sh"

STATE=$(blueutil --is-connect "$1")
COLOR="$GREY"
LABEL=""

if [ "$STATE" = "0" ]; then
    COLOR="$GREY"
    LABEL="N/A"
else
    COLOR="$BLUE"
    LABEL="$1"
fi

sketchybar --set $NAME icon.color=$COLOR label="$LABEL"
