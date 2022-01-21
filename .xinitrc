#!/bin/sh

/home/$USER/.local/bin/wal -R &
picom --config ~/.config/picom/picom.conf &
bar &
/home/cathal/.dev/bin/wall
while type dwm >/dev/null ; do dwm && continue || break ; done
