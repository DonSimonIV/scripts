#!/bin/bash

#pape='/home/eltito/Images/wallpapers/cloned/3screen.jpg'
image='/tmp/poster.png'
#button='/home/eltito/Images/kodi/resizemedia.png'
icon="/home/eltito/Images/lock/composite.png"
tmpbg='/tmp/screen.png'
music='/home/eltito/Images/lock/musicbg.png'

status=$(cmus-remote -Q | grep 'status' | cut -d ' ' -f2-) > /dev/null
query=$(basename -az $(cmus-remote -Q | grep file | cut -d ' ' -f2-)) > /dev/null


############################################
if [[ "$status" = "paused" ]] || [[ "$status" = "playing" ]]; then
	convert -background none -fill black -font Source-Code-Pro-Bold -size 650x200 label:"${query%.*}" /tmp/letters.png
#	convert "$pape" "$button" -gravity center -composite "$image"
#changed $image to $music
	convert "$music" /tmp/letters.png -gravity center -geometry +0+180 -composite "$image"
	cmus-remote -c -U
	i3lock -ui "$image" -n; amixer set Master toggle
	exit
else
	scrot -z "$tmpbg"
	convert "$tmpbg" -blur 0x2 "$tmpbg"
	convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
	i3lock -ui "$tmpbg" -n; amixer set Master toggle
fi

