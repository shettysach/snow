#!/bin/bash

status=$(playerctl status 2>/dev/null)

if [ "$status" = "Playing" ]; then
    text="󰐊"
elif [ "$status" = "Paused" ]; then
    text="󰏤"
else
    text="/"
fi

song=$(playerctl metadata --format '{{ title }} • {{ artist }}' 2>/dev/null)

echo "{\"text\": \"$text\", \"tooltip\": \"$song\"}"
exit 0
