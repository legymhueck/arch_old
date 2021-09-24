#!/bin/sh
sudo pacman -S lightdm lightdm-gtk-greeter

# Set autologin user in /etc/lightdm/lightdm.conf
# uncomment and define a user: #autologin-user=user

# Put yourself in the autologin group
sudo groupadd -r autologin
sudo gpasswd -a michael autologin