#!/bin/bash


icon="$HOME/Images/lock/composite.png"
tmpbg='/tmp/screen.png'

scrot -z "$tmpbg"

convert "$tmpbg" -blur 0x2 "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"

i3lock -ui "$tmpbg" -n; amixer set Master toggle > /dev/null
############################################

#how many programs output audio
number=$(fuser /dev/snd/controlC0 | wc -w)

if [[ "$number" = "0" ]]; then
  echo ""


elif [[ "$number" = "1" ]]; then
 	pid=$(basename -a $(fuser /dev/snd/controlC0))
 	name=$(basename -a $(ls -l /proc/$pid/exe | cut -d ' ' -f 12 ))

	if [[ "$name" = "cmus" ]]; then
	
	cmus-remote -c -U
	fi

	if [[ "$name" -eq "kodi-x11" ]]; then
		kodi-send --host=192.168.1.XX --port=9777 --action='Stop' > /dev/null
	fi
fi

if [[ "$number" -ge "2" ]]; then
	kodi-send --host=192.168.1.XX --port=9777 --action='Stop' > /dev/null
	cmus-remote -c -U
	
fi
