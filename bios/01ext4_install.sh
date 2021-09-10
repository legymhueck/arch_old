loadkeys de-latin1-nodeadkeys

sgdisk -o /dev/sda
sgdisk -n 1:0:+8M -t 1:ef02 -c 1:"BIOSBOOT" /dev/sda
sgdisk -n 2:0:0   -t 2:8300 -c 2:"ROOT"     /dev/sda

mkfs.ext4 -L ROOT /dev/sda2

mount /dev/sda2 /mnt

pacstrap /mnt base linux linux-firmware linux-headers efibootmgr sudo vim networkmanager

genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
