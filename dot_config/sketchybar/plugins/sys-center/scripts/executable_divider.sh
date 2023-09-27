#! /bin/sh

divider=(
    background.color="$BAR_BORDER_COLOR"
    background.border_color="$BAR_BORDER_COLOR"
    background.border_width=2
)
sketchybar  --add bracket status brew battery bluetooth volume wifi.alias \
            --set status "${divider[@]}"
