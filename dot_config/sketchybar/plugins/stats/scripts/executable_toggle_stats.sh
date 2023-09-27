#! /bin/sh

source "$CONFIG_DIR/icons.sh"

stats=(
network.up
network.down
)

hide_stats() {
    args=()
    for item in "${stats[@]}"; do
        args+=(--set "$item" drawing=off)
    done

    sketchybar "${args[@]}" \
        --set separator_right \
        icon=$SEPARATOR_RIGHT
}

show_stats() {
    args=()
    for item in "${stats[@]}"; do
        args+=(--set "$item" drawing=on)
    done

    sketchybar "${args[@]}" \
        --set separator_right \
        icon=$SEPARATOR_LEFT
    }

toggle_stats() {
    state=$(sketchybar --query separator_right | jq -r .icon.value)

    case $state in
        "􀆊")
            hide_stats
            ;;
        "􀯶")
            show_stats
            ;;
    esac
}

case "$SENDER" in
    "hide_stats")
        hide_stats
        ;;
    "show_stats")
        show_stats
        ;;
    "toggle_stats")
        toggle_stats
        ;;
esac
