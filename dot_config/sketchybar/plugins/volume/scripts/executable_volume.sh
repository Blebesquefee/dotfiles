#! /bin/sh

source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

volume_change() {
    case $CURRENT_VOLUME in
        [8-9][0-9]|100) ICON=$VOLUME_100 LABEL="$CURRENT_VOLUME%" ;;
        [5-7][0-9])     ICON=$VOLUME_66 LABEL="$CURRENT_VOLUME%" ;;
        [2-4][0-9])     ICON=$VOLUME_33 LABEL="$CURRENT_VOLUME%" ;;
        [1-9] | 1[1-9]) ICON=$VOLUME_10 LABEL="$CURRENT_VOLUME%" ;;
        *)              ICON=$VOLUME_0 LABEL="Mute" ;;
    esac

    sketchybar --set "$NAME" icon="$ICON" label=$LABEL

    if [ "$MUTED" = "true" ]; then
        sketchybar --set "$NAME" icon=$VOLUME_0 label=$LABEL
    fi
}

CURRENT_VOLUME=$(osascript -e 'output volume of (get volume settings)')
MUTED=$(osascript -e 'output muted of (get volume settings)')
volume_change
