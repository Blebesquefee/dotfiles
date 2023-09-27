#! /bin/sh

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

COUNT="$(brew outdated | wc -l | tr -d ' ')"

COLOR=$RED

case "$COUNT" in
  [3-5][0-9]) COLOR=$RED
  ;;
  [1-2][0-9]) COLOR=$ORANGE
  ;;
  [1-9]) COLOR=$YELLOW
  ;;
  0) COLOR=$GREY
  ;;
esac

sketchybar --set $NAME label=$COUNT icon.color=$COLOR
