#! /bin/sh

source "$CONFIG_DIR/colors.sh"

ADDRESS=$(blueutil --connected | grep -o ..-..-..-..-..-..)
STATE=$(blueutil --power)
COLOR="$GREY"
LABEL=""

if [ "$STATE" = 1 ]; then
    COLOR="$BLUE"
else
    COLOR="$GREY"
fi


if [ -z "$ADDRESS" ]; then
    LABEL="N/A"
else
    LABEL=$(blueutil --connected | grep -o "\"[[:alnum:]]*\"" | tr -d '"')
fi

sketchybar --set $NAME icon.color=$COLOR label="$LABEL"
