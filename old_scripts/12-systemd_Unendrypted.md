# Arch Linux install on btrfs with encryption

```bash
loadkeys de-latin1-nodeadkeys

gdisk /dev/sda
o -> create GPT
sgdisk -n 1:0:+500M -t 1:ef00 -c 1:"EFI"   /dev/sda
sgdisk -n 2:0:0     -t 2:8300 -c 2:"CRYPT" /dev/sda

mkfs.vfat -F 32 -n BOOT /dev/sda1
mkfs.btrfs -L CRYPT /dev/sda2

mount /dev/sda2 /mnt
btrfs su cr /mnt/@root
btrfs su cr /mnt/@home
btrfs su cr /mnt/@var
btrfs su cr /mnt/@opt
btrfs su cr /mnt/@swap
btrfs su cr /mnt/@.snapshots
umount /mnt

mount -o subvol=@root,ssd,compress=zstd,noatime /dev/sda2 /mnt
mkdir /mnt/{boot,home,var,opt,swap,.snapshots}

mount -o ssd,compress=zstd,noatime,subvol=@home /dev/sda2 /mnt/home
mount -o ssd,compress=zstd,noatime,subvol=@opt /dev/sda2 /mnt/opt
mount -o ssd,compress=zstd,noatime,subvol=@.snapshots /dev/sda2 /mnt/.snapshots

mount -o ssd,nodatacow,subvol=@swap /dev/sda2 /mnt/swap
mount -o ssd,nodatacow,subvol=@var /dev/sda2 /mnt/var

mount /dev/sda1 /mnt/boot

pacstrap /mnt base base-devel linux linux-headers linux-firmware efibootmgr btrfs-progs vim dosfstools mtools sudo xdg-user-dirs xdg-utils sudo networkmanager bash-completion

genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt

vim /etc/pacman.conf
CacheDir = /tmp/

ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc
vim /etc/locale.gen
locale-gen

vim /etc/locale.conf
LANG=en_US.UTF-8
LANGUAGE=en_US
LC_CTYPE="de_DE.UTF-8"
LC_NUMERIC="de_DE.UTF-8"
LC_TIME="de_DE.UTF-8"
LC_COLLATE="de_DE.UTF-8"
LC_MONETARY="de_DE.UTF-8"
LC_MESSAGES="de_DE.UTF-8"
LC_PAPER="de_DE.UTF-8"
LC_NAME="de_DE.UTF-8"
LC_ADDRESS="de_DE.UTF-8"
LC_TELEPHONE="de_DE.UTF-8"
LC_MEASUREMENT="de_DE.UTF-8"
LC_IDENTIFICATION="de_DE.UTF-8"
LC_ALL=

echo "KEYMAP=de-latin1" >> /etc/vconsole.conf

vim /etc/hostname
arch

vim /etc/hosts
127.0.0.1 localhost
::1       localhost
127.0.1.1 arch.localdomain  arch

passwd

vim /etc/mkinitcpio.conf
base udev block keyboard keymap autodetect modconf btrfs filesystems fsck
mkinitcpio -p linux

bootctl --path=/boot install

vim /boot/loader/loader.conf
default arch
timeout 1
editor 0

vim /boot/loader/entries/arch.conf
title ArchLinux
linux /vmlinuz-linux
initrd /initramfs-linux.img
options root=/dev/sda2 rootflags=subvol=@root quiet rw

systemctl enable systemd-timesyncd NetworkManager

EDITOR=vim visudo
%wheel ALL=(ALL) ALL

useradd -m -g users -G wheel,audio,video,disk,storage,optical,scanner,rfkill,input -s /bin/bash michael
passwd michael

echo "tmpfs   /tmp                tmpfs   rw,nodev,nosuid 0  0" >> /etc/fstab
echo "tmpfs   /home/arch/.cache   tmpfs   rw,nodev,nosuid 0  0" >> /etc/fstab

exit
umount -R /mnt
cryptsetup close arch
```
