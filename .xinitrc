#!/bin/sh

/home/$USER/.local/bin/wal -R &
xfce4-power-manager &
picom --config ~/.config/picom/picom.conf &
bar &
/home/cathal/.scripts/wall
while type dwm >/dev/null ; do dwm && continue || break ; done
# exec tdm --xstart
# exec dwm
