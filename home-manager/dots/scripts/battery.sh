#!/bin/bash

while true; do
  status=$(cat /sys/class/power_supply/BAT0/status)
  level=$(cat /sys/class/power_supply/BAT0/capacity)

  if [ "$status" == "Discharging" ]; then
      if [ "$level" -le 20 ]; then
          notify-send --urgency CRITICAL "BATTERY LOW" "$level%"  -t 60000
      elif [ "$level" -le 35 ]; then
          notify-send --urgency LOW "BATTERY LOW" "$level%"  -t 60000
      fi
  fi
  
  sleep 60
done
