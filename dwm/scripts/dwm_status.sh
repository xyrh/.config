#!/bin/sh

while true
do
	CPU=$(sed 's/000$/°C/' /sys/class/thermal/thermal_zone0/temp)
	MEMORY=$(free -h | awk '(NR==2){ print $4 }')
	VOL=$(amixer get Master | awk -F'[][]' 'END{ print $2 }')
	CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
	DATE=$(date "+%a %d-%m-%y %H:%M")
	
	xsetroot -name "CPU:$CPU|MEM:$MEMORY|VOL:$VOL|BAT:$CHARGE%|$DATE"
	sleep 3s
done &
