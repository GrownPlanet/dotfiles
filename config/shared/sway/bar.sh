#!/bin/bash

while true; do 
  date=$(date +"%d-%m-%Y")
  time=$(date +"%H:%M:%S")
  volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%d%%\n", $2 * 100}')

  echo "$volume | $time | $date"

  sleep 1
done
