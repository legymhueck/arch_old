#!/bin/bash
#set -e

func_install() {
  if pacman -Qi "$1" &>/dev/null; then
    tput setaf 2
    echo "The package '$1' is already installed"
    echo
    tput sgr0
  else
    tput setaf 3
    echo "Installing package " "$1"
    echo
    tput sgr0
    sudo pacman -S --noconfirm --needed "$1"
  fi
}

list=(
acpi
acpid
adobe-source-sans-pro-fonts
alacritty
alsa-firmware
alsa-lib
alsa-plugins
alsa-utils
arandr
arch-install-scripts
awesome-terminal-fonts
base-devel
bash-completion
brightnessctl
cantarell-fonts
cmus
doas
dosfstools
exfatprogs
flameshot
gnome-keyring
gnome-settings-daemon
gparted
gst-plugin-pipewire
gvfs
gvfs-afc
gvfs-gphoto2
gvfs-mtp
gvfs-nfs
gvfs-smb
htop
iwd
l3afpad
libgnome-keyring
libmp4v2
libpipewire02
libsecret
libxft
libxinerama
linux-firmware
lm_sensors
lxappearance-gtk3
lxterminal
mc
mtools
nodejs
noto-fonts-emoji
ntfs-3g
pipewire
pipewire-alsa
pipewire-jack
pipewire-media-session
pipewire-pulse
playerctl
polkit-gnome
powerline
powerline-fonts
pragha
python-pip
python-pygame
rsync
rxvt-unicode
rxvt-unicode-terminfo
samba
starship
tamsyn-font
ttf-bitstream-vera
ttf-dejavu
ttf-droid
ttf-hack
ttf-inconsolata
ttf-jetbrains-mono
ttf-liberation
ttf-opensans
ttf-roboto
ttf-ubuntu-font-family
udiskie
udisks2
urxvt-perls
volumeicon
wireplumber
wmctrl
wmname
xbindkeys
xdotool
xf86-video-ati
xf86-video-intel
xorg-server
xorg-xbacklight
xorg-xinit
xorg-xinput
xorg-xkill
xorg-xrandr
xorg-xrdb
xorg-xsetroot
)

for name in "${list[@]}"; do
  tput setaf 3 # colors
  echo "Installing $name"
  tput sgr0 # colors
  func_install "$name"
done
