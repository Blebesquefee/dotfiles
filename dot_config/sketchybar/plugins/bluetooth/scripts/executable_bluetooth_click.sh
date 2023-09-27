#! /bin/sh

STATE=$(blueutil -p)

if [ "$STATE" = "0" ]; then
    blueutil -p 1
    blueutil --connect 28-11-a5-77-8a-80
else
    blueutil -p 0
fi
