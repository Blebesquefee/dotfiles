#! /bin/sh

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")

sid=0
spaces=()

for i in "${!SPACE_ICONS[@]}"; do
    sid=$(($i+1))
    space=(
        associated_space=$sid
        icon=${SPACE_ICONS[i]}
        icon.highlight_color=$VIOLET
        icon.padding_left=16
        icon.padding_right=16
        label.drawing=off
        background.drawing=on
        background.padding_left=-7
        background.padding_right=-7
        script="$PLUGINS_DIR/spaces/scripts/spaces.sh"
        click_script="yabai -m space --focus $sid"
    )

    sketchybar  --add space space.$sid left             \
                --set space.$sid "${space[@]}"          \
                --subscribe space.$sid mouse.clicked
done
