#!/bin/bash

while true; do
  status=$(cat /sys/class/power_supply/BAT0/status)
  level=$(cat /sys/class/power_supply/BAT0/capacity)

  if [ "$status" == "Discharging" ] && [ "$level" -le 30 ]; then
      notify-send --urgency=CRITICAL "BATTERY LOW" "$level%"  -t 60000 
  fi
  
  sleep 60
done
