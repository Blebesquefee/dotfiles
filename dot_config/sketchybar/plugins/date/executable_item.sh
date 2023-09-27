#! /bin/sh

calendar_date=(
    icon.font="$FONT:Black:14.0"
    width=30
    y_offset=6
    update_freq=3600
    script="$PLUGINS_DIR/date/scripts/date.sh"
)

calendar_clock=(
    width=90
    y_offset=-8
    icon.font="$FONT:Semibold:13.0"
    background.padding_right=-15
    background.padding_left=40
    update_freq=5
    script="$PLUGINS_DIR/date/scripts/clock.sh"
)

sketchybar  --add item calendar.date right                  \
    --set calendar.date "${calendar_date[@]}"               \
    --subscribe calendar.date system_woke                   \
    --add item calendar.clock right                         \
    --set calendar.clock "${calendar_clock[@]}"             \
    --subscribe calendar.clock system_woke
