sgdisk -o /dev/sda
sgdisk -n 1:0:+300M -t 1:ef00 -c 1:"EFI"   /dev/sda
sgdisk -n 2:0:0     -t 2:8300 -c 2:"ROOT" /dev/sda

mkfs.vfat -F 32 -n BOOT /dev/sda1
mkfs.btrfs -f -L ROOT /dev/sda2

mount /dev/sda2 /mnt
btrfs su cr /mnt/@
btrfs su cr /mnt/@home
btrfs su cr /mnt/@var
umount /mnt

mount -o ssd,compress=zstd:1,noatime,discard=async,subvol=@ /dev/sda2 /mnt
mkdir /mnt/{boot,var,home}

mount -o ssd,compress=zstd:1,noatime,discard=async,subvol=@var /dev/sda2 /mnt/var
mount -o ssd,compress=zstd:1,noatime,discard=async,subvol=@home /dev/sda2 /mnt/home
mount /dev/sda1 /mnt/boot

pacstrap /mnt acpid alacritty alsa-utils base base-devel bash-completion btfs-progs doas doublecmd-gkt2 efibootmgr git gtk3 libgnome-keyring libnotify libxft libxss linux linux-headers linux-firmware notepadqq p7zip polkit powerline-fonts starship systemd-resolvconf ttf-nerd-fonts-symbols ttf-jetbrains-mono ttf-liberation vim xdg-user-dirs xorg-server xorg-xinit xorg-xsetroot

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt
