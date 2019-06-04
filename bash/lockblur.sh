#!/bin/bash

image='/tmp/poster.png'
icon="$HOME/Images/lock/composite.png"
music='$HOME/Images/lock/musicbg.png'
status=$(cmus-remote -Q | grep 'status' | cut -d ' ' -f2-) > /dev/null
query=$(basename -az $(cmus-remote -Q | grep file | cut -d ' ' -f2-)) > /dev/null

if [[ "$status" = "paused" ]] || [[ "$status" = "playing" ]]; then
	convert -background none -fill black -font Source-Code-Pro-Bold -size 650x200 label:"${query%.*}" "$image"
	convert "$music" "$image" -gravity center -geometry +0+180 -composite "$image"
	cmus-remote -c -U
	i3lock -ui "$image" -n; amixer set Master toggle
	exit
else
	scrot -z "$image"
	convert "$image" -blur 0x2 "$image"
	convert "$image" "$icon" -gravity center -composite -matte "$image"
	i3lock -ui "$image" -n; amixer set Master toggle
fi

