#! /bin/sh

IS_ACTIVE="$(airport info >> /dev/null || echo $?)"

if [ "$IS_ACTIVE" = "" ]; then
    airport off
else
    airport on
fi
