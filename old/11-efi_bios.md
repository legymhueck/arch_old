# Arch Linux install on btrfs with encryption

```bash
loadkeys de-latin1-nodeadkeys

gdisk /dev/sda
o -> create GPT
sgdisk -n 1:0:+1K   -t 1:ef02 -c 1:"BIOS"  /dev/sda
sgdisk -n 2:0:+260M -t 2:ef00 -c 2:"EFI"   /dev/sda
sgdisk -n 3:0:0     -t 3:8300 -c 3:"CRYPT" /dev/sda

cryptsetup luksFormat /dev/sda3
cryptsetup open /dev/sda3 arch
mkfs.vfat -F 32 -n BOOT /dev/sda2
mkfs.btrfs -L CRYPT /dev/mapper/arch

mount /dev/mapper/arch /mnt
btrfs su cr /mnt/@root
btrfs su cr /mnt/@home
btrfs su cr /mnt/@var
btrfs su cr /mnt/@opt
btrfs su cr /mnt/@swap
btrfs su cr /mnt/@.snapshots
umount /mnt

mount -o subvol=@root,ssd,compress=zstd,noatime /dev/mapper/arch /mnt
mkdir /mnt/{boot,home,var,opt,swap,.snapshots}

mount -o ssd,compress=zstd,noatime,subvol=@home /dev/mapper/arch /mnt/home
mount -o ssd,compress=zstd,noatime,subvol=@opt /dev/mapper/arch /mnt/opt
mount -o ssd,compress=zstd,noatime,subvol=@.snapshots /dev/mapper/arch /mnt/.snapshots

mount -o ssd,nodatacow,subvol=@swap /dev/mapper/arch /mnt/swap
mount -o ssd,nodatacow,subvol=@var /dev/mapper/arch /mnt/var

mount /dev/sda2 /mnt/boot

pacstrap /mnt base base-devel linux linux-headers linux-firmware grub efibootmgr btrfs-progs vim dosfstools mtools sudo xdg-user-dirs xdg-utils sudo networkmanager

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
base udev block keyboard keymap autodetect modconf encrypt btrfs filesystems fsck
mkinitcpio -p linux

grub-install --target=i386-pc --recheck --boot-directory=/boot /dev/sda
grub-install --target=x86_64-efi --efi-directory=/boot --boot-directory=/boot --bootloader-id=GRUB --removable

vim /etc/default/grub
GRUB_CMDLINE_LINUX="cryptdevice=UUID={UUID of /dev/sda3}:arch root=/dev/mapper/arch"
:r!blkid /dev/sda3

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable systemd-timesyncd NetworkManager

EDITOR=vim visudo
%wheel ALL=(ALL) ALL

useradd -m -g users -G wheel,audio,video,disk,storage,optical,scanner,rfkill,input -s /bin/bash michael
passwd michael

echo "tmpfs   /tmp                   tmpfs   rw,nodev,nosuid 0  0" >> /etc/fstab
echo "tmpfs   /home/arch/.cache   tmpfs   rw,nodev,nosuid 0  0" >> /etc/fstab

exit
umount -R /mnt
cryptsetup close arch
```
