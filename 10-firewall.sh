#!/bin/bash

# Firewall
echo "Firewall"
sudo pacman -S --needed --noconfirm firewalld ipset ebtables
sudo systemctl enable --now firewalld
# in a browser, open 'localhost:9090'

# Firewalld rules
sudo firewall-cmd --add-service libvirt --zone=libvirt --permanent
sudo firewall-cmd --add-port=1025-65535/tcp --zone=libvirt --permanent
sudo firewall-cmd --add-port=1025-65535/udp --zone=libvirt --permanent
sudo firewall-cmd --permanent --zone=public --add-port=5353/udp
sudo firewall-cmd --reload