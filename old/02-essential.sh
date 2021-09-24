#!/bin/bash

# Base
echo "Base"
sudo pacman -S --needed --noconfirm base-devel linux-firmware acpid lm_sensors libxft libxinerama bash-completion rsync htop

echo "File Systems"
sudo pacman -S --needed --noconfirm dosfstools mtools exfatprogs ntfs-3g udisks2 udiskie gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb 

#X
echo "X"
sudo pacman -S --needed --noconfirm xorg-server xorg-xinit xorg-xsetroot xorg-xrandr xorg-xkill xorg-xinput xorg-xrdb xf86-video-intel xf86-video-ati wmname

#Keys
echo "Keys"
sudo pacman -S --needed --noconfirm gnome-keyring libgnome-keyring libsecret polkit-gnome gnome-settings-daemon

# Fonts
echo "Fonts"
# noto-fonts
sudo pacman -S --needed --noconfirm awesome-terminal-fonts adobe-source-sans-pro-fonts cantarell-fonts ttf-bitstream-vera ttf-dejavu ttf-droid ttf-hack ttf-inconsolata ttf-liberation ttf-roboto ttf-ubuntu-font-family tamsyn-font ttf-opensans ttf-jetbrains-mono

# Internet
echo "Internet"
sudo pacman -S --needed --noconfirm networkmanager dnsutils whois

# Video driver
echo "Video Driver"
sudo pacman -S --needed --noconfirm xf86-video-intel xf86-video-ati arandr

# Audio
echo "Audio"
sudo pacman -S --needed --noconfirm pulseaudio pulseaudio-alsa pulseaudio-equalizer pulseaudio-jack alsa-firmware alsa-lib alsa-plugins alsa-utils pragha cmus libmp4v2 volumeicon playerctl

# MacBookAir
sudo pacman -S --needed --noconfirm brightnessctl xorg-xbacklight

# Assorted
echo "Various other stuff..."
sudo pacman -S --needed --noconfirm wmctrl xbindkeys wmctrl xdotool flameshot rofi alacritty
