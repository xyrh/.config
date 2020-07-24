#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
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
