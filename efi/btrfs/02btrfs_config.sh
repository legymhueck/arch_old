ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc
timedatectl set-timezone UTC

sed -i '/de_DE.UTF-8 UTF-8/s/^#//g' /etc/locale.gen
sed -i '/en_US.UTF-8 UTF-8/s/^#//g' /etc/locale.gen

locale-gen

echo "KEYMAP=de-latin1" >> /etc/vconsole.conf

echo "arch" > /etc/hostname

echo "127.0.0.1 localhost
::1       localhost
127.0.1.1 arch.localdomain  arch" > /etc/hosts

passwd

bootctl --path=/boot install

echo "default arch
timeout 1
editor 0" > /boot/loader/loader.conf

echo "title ArchLinux
linux /vmlinuz-linux
initrd /initramfs-linux.img
options root=/dev/sda2 rootflags=subvol=@ quiet rw" > /boot/loader/entries/arch.conf

systemctl enable systemd-homed
systemctl enable acpid
# systemctl enable NetworkManager
systemctl enable systemd-networkd
2systemctl enable systemd-resolved
# avahi-daemon

# sed -i '/%wheel ALL=(ALL) ALL/s/^#//g' /etc/sudoers
sed -i '/%wheel ALL=(ALL) NOPASSWD: ALL/s/^#//g' /etc/sudoers
sed -i '/BUILDDIR=\/tmp\/makepkg/s/^#//g' /etc/makepkg.conf
# echo 'permit nopass keepenv :wheel' > /etc/doas.conf
echo 'vm.swappiness=10' | tee /etc/sysctl.d/99-swappiness.conf

echo "tmpfs                                           /tmp                   tmpfs   rw,nodev,nosuid 0  0
#tmpfs                                           /home/michael/.cache   tmpfs   rw,nodev,nosuid 0  0
" >> /etc/fstab

echo "[Match]
Name=en*

[Network]
DHCP=yes
##Address=192.168.2.11/24
#Gateway=192.168.2.1
#DNS=192.168.2.3
> /etc/systemd/network/20-wired.network

#ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

# base udev block keymap keyboard autodetect modconf encrypt filesystems
exit
umount -R /mnt

