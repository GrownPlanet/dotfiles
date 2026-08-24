#!/bin/sh

while true; do 
  date=$(date +"%d-%m")
  time=$(date +"%H:%M:%S")
  volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%d\n", $2 * 100}')
  battery=$(cat /sys/class/power_supply/BAT1/capacity)

  echo "$battery% | $volume% | $time | $date "

  sleep 1
done
