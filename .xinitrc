#!/bin/sh

/home/$USER/.local/bin/wal -R &
picom --config ~/.config/picom/picom.conf &
dwmblocks &
wallpaper="/home/cathal/wallpapers/fish-nord.png"
feh --bg-fill $wallpaper || print "wallpaper not found $wallpaper" > ~/xinitrc_errors
which monitor && monitor &
while type dwm >/dev/null ; do dwm && continue || break ; done
