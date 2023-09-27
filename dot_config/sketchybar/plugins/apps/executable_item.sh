#! /bin/sh

APP_SCRIPT='[ "$SENDER" = "front_app_switched" ] && sketchybar --set $NAME label="$INFO"'

separator=(
    icon=$SEPARATOR_LEFT
    padding_left=10
    padding_right=0
    label.drawing=off
    associated_display=active
)

sketchybar  --add item separator left                   \
            --set separator "${separator[@]}"

apps=(
    icon.drawing=off
    associated_display=active
    script="$APP_SCRIPT"
)

sketchybar  --add item apps left        \
            --set apps "${apps[@]}"     \
            --subscribe apps front_app_switched
