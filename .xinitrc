#!/bin/sh

xrdb -merge /home/eltito/.Xresources

exec /usr/bin/i3

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
