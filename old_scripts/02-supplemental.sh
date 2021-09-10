#!/bin/bash

# Internet not essential 
#echo "Internet not essential"
#sudo pacman -S --needed --noconfirm network-manager-applet nm-connection-editor

# Video
echo "Video"
sudo pacman -S --needed --noconfirm vlc mpv handbrake mediathek

# Image
echo "Image"
sudo pacman -S --needed --noconfirm imagemagick gimp feh geeqie gpicview-gtk3 ristretto sxiv

# Codecs
echo "Codecs"
sudo pacman -S --needed --noconfirm gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-libav gst-libav libdvdcss 

# Spelling
echo "Spelling"
sudo pacman -S --needed --noconfirm hunspell hunspell-de hunspell-en_GB hunspell-en_US aspell aspell-de aspell-en hyphen hyphen-de hyphen-en

# Packer
sudo pacman -S --needed --noconfirm p7zip unzip libunrar

# Printer
echo "Printer"
sudo pacman -S --needed --noconfirm cups libcups gsfonts system-config-printer ghostscript gtk3-print-backends

# Printer Driver
echo "Printer Driver"
sudo pacman -S --needed --noconfirm foomatic-db foomatic-db-engine foomatic-db-nonfree foomatic-db-nonfree-ppds foomatic-db-gutenprint-ppds splix gutenprint

# PDF
echo "PDF"
sudo pacman -S --needed --noconfirm epdfview img2pdf xpdf cups-pdf

# Nextcloud
#echo "Nextcloud"
#sudo pacman -S --needed --noconfirm nextcloud nextcloud-client nextcloud-app-tasks nextcloud-app-spreed nextcloud-app-notes nextcloud-app-mail nextcloud-app-contacts nextcloud-app-calendar nextcloud-app-bookmarks

# Wireless
echo "Wireless"
sudo pacman -S --needed --noconfirm wpa_supplicant broadcom-wl

# Programme
echo "Programme"
sudo pacman -S --needed --noconfirm aria2 osdbattery catfish mlocate plocate gpart gparted mc rofi alacritty doublecmd-gtk2 lxappearance-gtk3 youtube-dl simplescreenrecorder simple-scan notepadqq deadbeef upower rsync

# Keyboard shortcuts dwm
#echo "Keyboard shortcuts dwm"
#sudo pacman -S --needed --noconfirm sxhkd

# Firewall
echo "Firewall"
sudo pacman -S --needed --noconfirm firewalld ipset ebtables
sudo systemctl enable --now firewalld
# in a browser, open 'localhost:9090'

# Cockpit
#sudo pacman -S --needed --noconfirm cockpit packagekit
#sudo systemctl enable --now cockpit.socket

# Activating services
echo "Activating services"
sudo systemctl enable fstrim.timer

#YAY
git clone https://aur.archlinux.org/yay
cd yay
makepkg -si yay

# Firewalld rules
sudo firewall-cmd --add-service libvirt --zone=libvirt --permanent

echo "YAY packages"
yay ventoy filius jetbrains-toolbox teamviewer spotify ttf-ms-fonts
