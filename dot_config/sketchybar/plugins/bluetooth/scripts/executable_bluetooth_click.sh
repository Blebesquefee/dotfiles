#! /bin/sh

STATE=$(blueutil -p)

if [ "$STATE" = "0" ]; then
    blueutil -p 1
    blueutil --connect "$1"
else
    blueutil --disconnect "$1"
    blueutil -p 0
fi
