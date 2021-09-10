ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc

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
options root=/dev/sda2 quiet rw lang=de locale=de_DE.UTF-8" > /boot/loader/entries/arch.conf

systemctl enable NetworkManager
systemctl enable systemd-homed
systemctl enable acpid

sed -i '/%wheel ALL=(ALL) ALL/s/^#//g' /etc/sudoers
echo 'permit nopass keepenv :wheel' > /etc/doas.conf
echo 'vm.swappiness=10' | tee /etc/sysctl.d/99-swappiness.conf

umount -R /mnt
