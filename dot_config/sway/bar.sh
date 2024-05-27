while true
do 
  datetime=$(date +'%H:%M:%S - %d-%m-%Y')
  volume=$(amixer sget Master | awk -F"[][]" '/Left:/ { print $2 }')

  echo "$datetime - $volume"

  sleep 1
done
