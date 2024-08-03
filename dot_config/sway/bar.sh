while true
do 
  datetime=$(date +'%H:%M:%S - %d-%m-%Y')
  volume=$(amixer sget Master | awk -F"[][]" '/Left:/ { print $2 }')

  battery=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | awk '/percentage/ {print $2}')

  echo "$datetime - $volume | $battery"

  sleep 1
done
