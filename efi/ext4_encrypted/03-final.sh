mkfs.vfat -F 32 -n BOOT /dev/sda1
mkfs.ext4 -L ROOT /dev/mapper/arch

mount /dev/mapper/arch /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

pacstrap /mnt base base-devel linux linux-firmware linux-headers efibootmgr sudo vim networkmanager git intel-ucode

genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
