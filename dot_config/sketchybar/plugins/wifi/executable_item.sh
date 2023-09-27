#! /bin/sh

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

wifi_alias=(
    icon=$WIFI
    popup.y_offset=$PADDINGS
    script="$PLUGINS_DIR/wifi/scripts/wifi.sh"
    click_script="$PLUGINS_DIR/wifi/scripts/wifi_click.sh"
)

wifi_details=(
    icon.drawing=off
    label.font="$FONT:Semibold:10.0"
    click_script="sketchybar --set wifi.alias popup.drawing=off"
)

sketchybar  --add alias  "Control Center,WiFi" right                    \
            --rename     "Control Center,WiFi" wifi.alias               \
            --set        wifi.alias    "${wifi_alias[@]}"               \
            --subscribe  wifi.alias     mouse.entered                   \
                                        mouse.exited                    \
                                        mouse.exited.global             \
                                        wifi_change                     \
                                                                        \
            --add       item          wifi.details popup.wifi.alias     \
            --set       wifi.details  "${wifi_details[@]}"

