sudo pacman -S syslinux gptfdisk mtools

ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc

# sed -i '/de_DE.UTF-8 UTF-8/s/^#//g' /etc/locale.gen
sed -i '/en_US.UTF-8 UTF-8/s/^#//g' /etc/locale.gen

locale-gen

echo "KEYMAP=de-latin1" >> /etc/vconsole.conf

echo "arch" > /etc/hostname

echo "127.0.0.1 localhost
::1       localhost
127.0.1.1 arch.localdomain  arch" > /etc/hosts

syslinux-install_update -iam

passwd

systemctl enable systemd-timesyncd systemd-homed NetworkManager
# sed -i '/%wheel ALL=(ALL) ALL/s/^#//g' /etc/sudoers
sed -i '/%wheel ALL=(ALL) NOPASSWD: ALL/s/^#//g' /etc/sudoers
exit
umount -R /mnt
