sgdisk -o /dev/sda
sgdisk -n 1:0:+300M -t 1:ef00 -c 1:"EFI"   /dev/sda
sgdisk -n 2:0:0     -t 2:8300 -c 2:"ROOT" /dev/sda

cryptsetup luksFormat /dev/sda2
cryptsetup open /dev/sda2 arch

mkfs.vfat -F 32 -n BOOT /dev/sda1
mkfs.ext4 -L ROOT /dev/mapper/arch

mount /dev/mapper/arch /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

pacstrap /mnt base base-devel linux linux-firmware linux-headers efibootmgr sudo vim networkmanager git intel-ucode

genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
