#!/bin/bash

pape='$HOME/Images/wallpapers/cloned/3screen.jpg'
image='/tmp/poster.png'
status=$(cmus-remote -Q | grep 'status' | cut -d ' ' -f2-)
button='$HOME/Images/kodi/resizemedia.png'

shift
#query="$(texturecache status | grep Title | cut - d ' ' -f2- | sed 's/://g' | awk '{$1=$1;print}')"
query=$(basename -az $(cmus-remote -Q | grep file | cut -d ' ' -f2-)) > /dev/null
echo "${query%.*}"
if [[ "$status" = "playing" ]]; then
#	convert "$image" -resize 260x260 "$image"
	convert -background none -fill black -font Source-Code-Pro-Bold -size 650x200 label:"${query%.*}" /tmp/letters.png
	convert "$pape" "$button" -gravity center  -composite "$image"
	convert "$image" /tmp/letters.png -gravity center -geometry +0+180 -composite "$image"
#southeast	convert "$image" "$button" -gravity center -composite "$image"

#	i3lock -ui "$image"
	feh "$image"
else
	exit

fi
