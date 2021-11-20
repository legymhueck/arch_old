#!/bin/bash
# echo $(whoami)
# echo $(id -n -u)
mkdir -p /home/$(whoami)/michael/Downloads/git/paru
cd /home/michael/Downloads/git/paru
git clone https://aur.archlinux.org/paru-bin
cd paru-bin
makepkg -si --noconfirm

