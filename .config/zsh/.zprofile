#bash /usr/local/bin/tdm

# set PATH so it includes user's private ~/.local/bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$HOME/.dev/bin" ] ; then
    PATH="$HOME/.dev/bin:$PATH"
fi

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

source /home/cathal/.nix-profile/etc/profile.d/nix.sh
