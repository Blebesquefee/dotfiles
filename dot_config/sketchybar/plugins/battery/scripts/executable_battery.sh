#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

not_charging() {
    case ${BATT_PERCENT} in
        100)        ICON=$BATTERY_100   COLOR=$GREEN ;;
        9[0-9])     ICON=$BATTERY_100   COLOR=$GREEN ;;
        8[0-9])     ICON=$BATTERY_100   COLOR=$GREEN ;;
        7[0-9])     ICON=$BATTERY_75    COLOR=$GREEN ;;
        6[0-9])     ICON=$BATTERY_75    COLOR=$YELLOW ;;
        5[0-9])     ICON=$BATTERY_50    COLOR=$YELLOW ;;
        4[0-9])     ICON=$BATTERY_50    COLOR=$YELLOW ;;
        3[0-9])     ICON=$BATTERY_25    COLOR=$ORANGE ;;
        2[0-9])     ICON=$BATTERY_25    COLOR=$ORANGE ;;
        1[0-9])     ICON=$BATTERY_0     COLOR=$RED ;;
        [0-9])      ICON=$BATTERY_0     COLOR=$RED ;;
    esac

    sketchybar --set "$NAME" icon="$ICON" icon.color="$COLOR"
    sketchybar --set "$NAME" label="$BATT_PERCENT%"
}

charging() {
    case ${BATT_PERCENT} in
        100)        ICON=$BATTERY_CHARGING   COLOR=$GREEN ;;
        9[0-9])     ICON=$BATTERY_CHARGING   COLOR=$GREEN ;;
        8[0-9])     ICON=$BATTERY_CHARGING   COLOR=$GREEN ;;
        7[0-9])     ICON=$BATTERY_CHARGING   COLOR=$GREEN ;;
        6[0-9])     ICON=$BATTERY_CHARGING   COLOR=$YELLOW ;;
        5[0-9])     ICON=$BATTERY_CHARGING   COLOR=$YELLOW ;;
        4[0-9])     ICON=$BATTERY_CHARGING   COLOR=$YELLOW ;;
        3[0-9])     ICON=$BATTERY_CHARGING   COLOR=$ORANGE ;;
        2[0-9])     ICON=$BATTERY_CHARGING   COLOR=$ORANGE ;;
        1[0-9])     ICON=$BATTERY_CHARGING   COLOR=$RED ;;
        [0-9])      ICON=$BATTERY_CHARGING   COLOR=$RED ;;
    esac

    sketchybar --set "$NAME" icon="$ICON" icon.color="$COLOR"
    sketchybar --set "$NAME" label="$BATT_PERCENT%"
}

render_bar_item() {

    if [[ ${CHARGING} = "" ]]; then
        not_charging
    else
        charging
    fi
}

BATT_COMMAND=$(pmset -g batt)
BATT_PERCENT=$(echo "$BATT_COMMAND" | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(echo "$BATT_COMMAND" | grep 'AC Power')

render_bar_item
