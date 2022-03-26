#!/bin/sh

/home/$USER/.local/bin/wal -R &
picom --config ~/.config/picom/picom.conf &
#bar &
dwmblocks &
dunst &
/home/cathal/.dev/bin/wall
# xinput --set-prop "pointer:Ploopy Corporation Trackball Mini" "libinput Accel Speed" -1.0
while type dwm >/dev/null ; do dwm && continue || break ; done
