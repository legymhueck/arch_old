#!/bin/bash
sudo pacman -S --needed qemu libvirt virt-manager ebtables dnsmasq bridge-utils dmidecode ovmf qemu-arch-extra dnsmasq openbsd-netcat screen virt-viewer virt-install
#sudo systemctl enable libvirtd
sudo gpasswd -a michael libvirt
sudo gpasswd -a michael kvm

sudo vim /etc/libvirt/libvirtd.conf
# line 81: unix_sock_group = "libvirt"
# uncomment line 104: unix_sock_rw_perms = "0770"


#sudo systemctl restart --now libvirtd
#sudo virsh net-autostart default
#sudo virsh net-start default

# Firewalld rules
#sudo firewall-cmd --add-service libvirt --zone=libvirt --permanent

#sudo vim /etc/modprobe.d/kvm_intel.conf
#options kvm_intel nested=1
#options kvm_intel emulate_invalid_guest_state=0
#options kvm ignore_msrs=1 report_ignored_msrs=0
