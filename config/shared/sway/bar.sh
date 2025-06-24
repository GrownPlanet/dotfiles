#!/bin/bash

while true
do 
  datetime=$(date +'%H:%M:%S | %d-%m-%Y')
  volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%d%%\n", $2 * 100}')

  echo "$datetime | $volume"

  sleep 1
done
