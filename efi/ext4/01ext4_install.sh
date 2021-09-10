loadkeys de-latin1-nodeadkeys

sgdisk -o /dev/sda
sgdisk -n 1:0:+300M -t 1:ef00 -c 1:"EFI"   /dev/sda
sgdisk -n 2:0:0     -t 2:8300 -c 2:"ROOT" /dev/sda

mkfs.vfat -F 32 -n BOOT /dev/sda1
mkfs.ext4 -L ROOT /dev/sda2

mount /dev/sda2 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

pacstrap /mnt base linux linux-firmware linux-headers efibootmgr sudo opendoas vim networkmanager git

genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
