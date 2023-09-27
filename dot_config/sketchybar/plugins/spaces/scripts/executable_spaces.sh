#! /bin/sh

update(){
    source "$CONFIG_DIR/colors.sh"
    sketchybar --set $NAME  icon.highlight=$SELECTED        \
                            label.highlight=$SELECTED       \
                            background.color=$BAR_BORDER_COLOR
}

case "$SENDER" in
    *) update
    ;;
esac
