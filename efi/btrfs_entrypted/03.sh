mkfs.vfat -F 32 -n BOOT /dev/sda1
mkfs.btrfs -f -L ROOT /dev/mapper/arch

mount /dev/mapper/arch /mnt
btrfs su cr /mnt/@
btrfs su cr /mnt/@home
btrfs su cr /mnt/@var
umount /mnt

mount -o ssd,compress=zstd:1,noatime,discard=async,subvol=@ /dev/mapper/arch /mnt
mkdir /mnt/{boot,var,home}

mount -o ssd,compress=zstd:1,noatime,discard=async,subvol=@var /dev/mapper/arch /mnt/var
mount -o ssd,compress=zstd:1,noatime,discard=async,subvol=@home /dev/mapper/arch /mnt/home
mount /dev/sda1 /mnt/boot

pacstrap /mnt base base-devel linux linux-headers linux-firmware efibootmgr sudo vim dosfstools mtools btrfs-progs xdg-user-dirs git acpid polkit networkmanager intel-ucode
# systemd-resolvconf
# nss-mdns

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt
