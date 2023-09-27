#! /bin/sh

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

brew=(
  icon=$BREW
  label=?
  padding_left=0
  padding_right=10
  script="$PLUGINS_DIR/brew/scripts/brew.sh"
)

sketchybar --add event brew_update \
           --add item brew right   \
           --set brew "${brew[@]}" \
           --subscribe brew brew_update
