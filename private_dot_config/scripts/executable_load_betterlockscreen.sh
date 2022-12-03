#! /bin/sh

filename=$HOME/.cache/dwall_current

while read line
do
    exec betterlockscreen -u $line
done < $filename
