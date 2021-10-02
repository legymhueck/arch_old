#!/bin/sh

# Language
setxkbmap de &

# Gnome Keyring
gnome-keyring-daemon -r -d &

#.Xresources
userresources=$HOME/.Xresources
sysresources=/etc/X11/xinit/.Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Java applications
wmname LG3D

# Autostart
#exec slstatus &
#exec megasync &
#exec insync start &
#exec /home/michael/.screenlayout/arch.sh &
#feh --bg-fill --randomize ~/Downloads/git/archInst/wallpapers/* &
exec dwmblocks &
# exec unclutter -idle 6 &
#exec picom &
#exec feh --bg-scale /home/michael/.config/wallpapers/arch01.jpg &
#exec insync &
exec dbus-run-session dwm
