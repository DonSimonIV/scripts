#!/bin/bash

icon="/home/eltito/Images/lock/lock.png"
tmpbg='/tmp/screen.png'
preview='/home/eltito/Images/kodi/buttonplay.png'

scrot -z "$tmpbg"

convert "$tmpbg" -blur 0x2 "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite "$tmpbg"

i3lock -ui "$tmpbg" -n; amixer set Master toggle > /dev/null

#######################################
#programs

number=$(fuser /dev/snd/controlC0 | wc -w)
echo "$number"

if [[ "$number" = "0" ]]; then
	i3lock -ui "$tmpbg" -n; amixer set Master toggle > /dev/null



elif [[ "$number" = "1" ]]; then
#	echo "this"
 	pid=$(basename -a $(fuser /dev/snd/controlC0))
 	name=$(basename -a $(ls -l /proc/$pid/exe | cut -d ' ' -f 12 ))
#	echo "$name"  

#fi
	if [[ "$name" = "cmus" ]]; then
#		echo "good"    
		cmus-remote -c -U; exit
		i3lock -ui "$tmpbg" -n; amixer set Master toggle > /dev/null

	fi

#fi

	if [[ "$name" -eq "kodi-x11" ]]; then
		kodi-send --host=192.168.1.XX --port=9777 --action='Pause' > /dev/null
		convert "$tmpbg" "$preview" -gravity center -composite "$tmpbg" 
		i3lock -ui "$tmpbg" -n; amixer set Master toggle > /dev/null
	fi
fi

if [[ "$number" -ge "2" ]]; then
	kodi-send --host=192.168.1.XX --port=9777 --action='Pause' > /dev/null
	cmus-remote -c -U
	convert "$tmpbg" "$preview" -gravity center -composite "$tmpbg" 
	i3lock -ni "$tmpbg" -n; amixer set Master toggle > /dev/null
	
fi

