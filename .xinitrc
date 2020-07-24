#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
#. /etc/X11/Xsession

xinput disable "Elan Touchpad"

export GTK_IM_MODULE=xim
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=xim
ibus-daemon -drx

while true
do
	CPU=$(sed 's/000$/°C/' /sys/class/thermal/thermal_zone0/temp)
	MEMORY=$(free -h | awk '(NR==2){ print $7 }')
	VOL=$(amixer get Master | awk -F'[][]' 'END{ print $2 }')
	CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
	DATE=$(date "+%a %d-%m-%y %H:%M")
	
	xsetroot -name "CPU:$CPU|MEM:$MEMORY|VOL:$VOL|BAT:$CHARGE%|$DATE"
	sleep 3s
done &

exec dwm
