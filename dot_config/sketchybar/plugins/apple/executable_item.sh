#!/bin/bash

POPUP_OFF='sketchybar --set apple.logo popup.drawing=off'
POPUP_CLICK_SCRIPT='sketchybar --set $NAME popup.drawing=toggle'

apple_logo=(
    icon=$APPLE
    icon.font="$FONT:Black:16.0"
    padding_left=10
    padding_right=0
    label.drawing=on
    click_script="$POPUP_CLICK_SCRIPT"
    popup.y_offset=5
    popup.align=left
    popup.height=35
)

apple_infos=(
    icon=$ABOUT
    label="About This Mac"
    click_script="open -a 'System Information'; $POPUP_OFF"
)

apple_prefs=(
    icon=$PREFERENCES
    label="Preferences"
    click_script="open -a 'System Preferences'; $POPUP_OFF"
)

apple_lock=(
    icon=$LOCK
    label="Lock Screen"
    click_script="pmset displaysleepnow; $POPUP_OFF"
)

apple_restart=(
    icon=$RESTART
    label="Restart"
    click_script="osascript -e 'tell app \"System Events\" to restart'"
)

apple_power=(
    icon=$POWER
    label="Shut Down"
    click_script="osascript -e 'tell app \"System Events\" to shut down'"
)

sketchybar --add item apple.logo left               \
    --set apple.logo "${apple_logo[@]}"             \
    \
    --add item apple.infos popup.apple.logo         \
    --set apple.infos "${apple_infos[@]}"           \
    \
    --add item apple.prefs popup.apple.logo         \
    --set apple.prefs "${apple_prefs[@]}"           \
    \
    --add item apple.lock popup.apple.logo          \
    --set apple.lock "${apple_lock[@]}"             \
    \
    --add item apple.restart popup.apple.logo       \
    --set apple.restart "${apple_restart[@]}"       \
    \
    --add item apple.power popup.apple.logo         \
    --set apple.power "${apple_power[@]}"           \
    \
