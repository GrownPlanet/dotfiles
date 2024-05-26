while true
do 
  datetime=$(date +'%Y-%m-%d %H:%M:%S')
  volume=$(amixer sget Master | awk -F"[][]" '/Left:/ { print $2 }')

  echo "$datetime | $volume"

  sleep 1
done
