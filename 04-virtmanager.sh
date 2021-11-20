#!/bin/bash
sudo pacman -S --needed qemu libvirt virt-manager ebtables dnsmasq bridge-utils dmidecode ovmf qemu-arch-extra dnsmasq openbsd-netcat screen virt-viewer virt-install
#sudo systemctl enable libvirtd
# sudo gpasswd -a michael libvirt
# sudo gpasswd -a michael kvm

sudo vim /etc/libvirt/libvirtd.conf
# line 81: unix_sock_group = "libvirt"
# uncomment line 104: unix_sock_rw_perms = "0770"

sudo vim /etc/libvirt/qemu.conf
# user = "michael"
# group = "wheel"

#sudo systemctl restart --now libvirtd
#sudo virsh net-autostart default
#sudo virsh net-start default

# Firewalld rules
#sudo firewall-cmd --add-service libvirt --zone=libvirt --permanent

#sudo vim /etc/modprobe.d/kvm_intel.conf
#options kvm_intel nested=1
#options kvm_intel emulate_invalid_guest_state=0
#options kvm ignore_msrs=1 report_ignored_msrs=0

# Take snapshots of UEFI drives
# sudo su
# export EDITOR=vim
# virsh edit {name of vm}
# replace: <loader readonly='yes' type='pflash'>/usr/share/edk2/ovmf/OVMF_CODE.fd</loader>
# with:    <loader readonly='yes' type='rom'>/usr/share/edk2-ovmf/x64/OVMF_CODE.fd</loader>


# Edit the xml and add
# </features>
#  <cpu mode='host-passthrough' check='none'>
#    <topology sockets='1' cores='6' threads='2'/>
#    <feature policy='disable' name='smep'/>
#  </cpu>
