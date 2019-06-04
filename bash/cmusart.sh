#!/bin/bash

#Not tested, the covers are random
#no good

#INFO
pape='$HOME/Images/wallpapers/cloned/3screen.jpg'
image='/tmp/poster.png'
status=$(cmus-remote -Q | grep 'status' | cut -d ' ' -f2-)
button='$HOME/Images/kodi/resizemedia.png'

shift
#query="$(texturecache status | grep Title | cut - d ' ' -f2- | sed 's/://g' | awk '{$1=$1;print}')"
query=$(basename -az $(cmus-remote -Q | grep file | cut -d ' ' -f2-)) > /dev/null
echo "${query%.*}"
if [[ "$status" = "playing" ]]; then
#	imagelink=$(wget --user-agent 'Mozilla/5.0' -qO -  "www.google.be/search?q=${query}&tbm=isch" | sed 's/</\n</g' | grep '<img' | head -n1 | tail -n1 | sed 's/.*src="\([^"]*\)".*/\1/') > /tmp/null
	imagelink=$(wget --user-agent 'Mozilla/5.0' -qO -  "www.google.be/search?q=${query}&tbs=ift:jpg,islt:svga,isz:l&tbm=isch" | sed 's/</\n</g' | grep '<img' | head -n3 | tail -n1 | sed 's/.*src="\([^"]*\)".*/\1/') > /tmp/null
#	echo "$imagelink"
	wget -qO $image $imagelink

	#############
	convert "$image" -resize 260x260 "$image"
	convert "$pape" "$image" -gravity center -geometry +30+30 -composite "$image"
#southeast	convert "$image" "$button" -gravity center -composite "$image"
#	i3lock -ui "$image"
	feh "$image"
else
    exit
fi
