#!/bin/bash
#set -e

func_install() {
  if pacman -Qi "$1" &>/dev/null; then
    tput setaf 2
    echo "###############################################################################"
    echo "The package '$1' is already installed"
    echo "###############################################################################"
    echo
    tput sgr0
  else
    tput setaf 3
    echo "###############################################################################"
    echo "Installing package " "$1"
    echo "###############################################################################"
    echo
    tput sgr0
    sudo pacman -S --noconfirm --needed "$1"
  fi
}

###############################################################################
echo "Installation of sound software"
###############################################################################

list=(
  acpid lm_sensors
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
  l3afpad
  libgnome-keyring
  libmp4v2
  libpipewire02
  libsecret
  libxft
  libxinerama
  linux-firmware
  lxappearance-gtk3
  lxterminal
  mc
  mtools
  ntfs-3g
  nodejs
  noto-fonts-emoji
  pipewire
  pipewire-alsa
  pipewire-jack
  pipewire-media-session
  pipewire-pulse
  playerctl
  polkit-gnome
  powerline-fonts
  pragha
  pulseeffects
  python-pip
  python-pygame
  rsync
  rxvt-unicode
  rxvt-unicode-terminfo
  urxvt-perls
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

count=0

for name in "${list[@]}"; do
  count=$((count + 1))
  tput setaf 3
  echo "Installing package nr.  "$count " " "$name"
  tput sgr0
  func_install "$name"
done

###############################################################################

tput setaf 11
echo "################################################################"
echo "All packages have been installed"
echo "################################################################"
echo
tput sgr0

# Git
git config --global credential.helper /usr/lib/git-core/git-credential-libsecret
