# Arch Linux install on ext4 without encryption

```bash
loadkeys de-latin1-nodeadkeys

sgdisk -o /dev/sda
sgdisk -n 1:0:+500M -t 1:ef00 -c 1:"EFI"   /dev/sda
sgdisk -n 2:0:0     -t 2:8300 -c 2:"ROOT" /dev/sda

mkfs.vfat -F 32 -n BOOT /dev/sda1
mkfs.ext4 -L ROOT /dev/sda2

mount /dev/sda2 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

pacstrap /mnt base linux efibootmgr sudo vim

genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt

ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc

sed -i '/de_DE.UTF-8 UTF-8/s/^#//g' /etc/locale.gen
sed -i '/en_DK.UTF-8 UTF-8/s/^#//g' /etc/locale.gen

locale-gen

echo "KEYMAP=de-latin1" >> /etc/vconsole.conf

echo "arch" > /etc/hostname

echo "127.0.0.1 localhost
::1       localhost
127.0.1.1 arch.localdomain  arch" > /etc/hosts

passwd

echo "[Match]
Name=en*

[Network]
DHCP=yes
#Address=192.168.2.11/24
#Gateway=192.168.2.1
#DNS=192.168.2.3
" > /etc/systemd/network/20-wired.network

ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

bootctl --path=/boot install

echo "default arch
timeout 1
editor 0" > /boot/loader/loader.conf

echo "title ArchLinux
linux /vmlinuz-linux
initrd /initramfs-linux.img
options root=/dev/sda2 quiet rw" > /boot/loader/entries/arch.conf

systemctl enable systemd-timesyncd systemd-networkd systemd-resolved

sed -i '/%wheel ALL=(ALL) ALL/s/^#//g' /etc/sudoers

useradd -m -g users -G wheel,audio,video,disk,storage,optical,scanner,rfkill,input -s /bin/bash michael
passwd michael

exit
umount -R /mnt
```
