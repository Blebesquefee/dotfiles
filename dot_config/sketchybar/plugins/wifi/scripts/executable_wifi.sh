#!/usr/bin/env bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

update_icon() {
    COLOR=$GREY
    if [ "$IS_ACTIVE" = "" ]; then
        COLOR=$VIOLET
    else
        COLOR=$GREY
    fi
    sketchybar --set $NAME icon.color=$COLOR
}

render_bar_item() {
    if [ "$SSID" = "" ]; then
        args+=(--set "$NAME" label="N/A")
    else
        args+=(--set "$NAME" label="$SSID" label.drawing=on)
    fi
}

render_popup() {
    args+=(--set wifi.details label="$(airport info)")
    sketchybar -m "${args[@]}" >/dev/null
}

update() {
    SSID="$(airport ssid)"
    IS_ACTIVE="$(airport info >> /dev/null || echo $?)"

    args=()

    render_bar_item
    render_popup
    update_icon

    if [ "$SENDER" = "forced" ]; then
        sketchybar --animate tanh 15 --set "$NAME" label.y_offset=0 label.y_offset=0
    fi
}

popup() {
    IS_ACTIVE="$(airport info >> /dev/null || echo $?)"

    if [ "$IS_ACTIVE" = "" ]; then
        sketchybar --set "$NAME" popup.drawing="$1"
    else
        sketchybar --set "$NAME" popup.drawing=off
    fi
}

case "$SENDER" in
    "wifi_change" | "routine" | "forced")
        update
        ;;
    "mouse.entered")
        popup on
        ;;
    "mouse.exited" | "mouse.exited.global")
        popup off
        ;;
esac
