# Post install commands

```bash
## Set limit

sudo nano /etc/systemd/journald.conf
    Storage=volatile
    SystemMaxUse=6M

## Reduce journal file size

journalctl --vacuum-size=10M

## Delete older entries

journalctl --vacuum-time=2weeks

## fstrim.timer

sudo systemctl enable fstrim.timer

## Tearfree

vim /etc/X11/xorg.conf.d/20-intel.conf
Section "Device"
     Identifier "Intel Graphics"
     Driver "intel"
     Option "DRI" "3"
     Option "AccelMethod" "sna"
     Option "TearFree" "true"
EndSection

vim /etc/X11/xorg.conf.d/20-radeon.conf
Section "Device"
     Identifier "AMD"
     Driver "radeon"
     Option "TearFree" "true"
EndSection
```

## Repair

```bash
cryptsetup open /dev/sda3 le

mount -o subvol=@root,ssd,compress=zstd,noatime /dev/mapper/michael /mnt
mount -o ssd,compress=zstd,noatime,subvol=@home /dev/mapper/michael /mnt/home
mount -o ssd,compress=zstd,noatime,subvol=@opt /dev/mapper/michael /mnt/opt
mount -o ssd,compress=zstd,noatime,subvol=@.snapshots /dev/mapper/michael /mnt/.snapshots
mount -o ssd,nodatacow,subvol=@swap /dev/mapper/michael /mnt/swap
mount -o ssd,nodatacow,subvol=@var /dev/mapper/michael /mnt/var
mount /dev/sda2 /mnt/boot

arch-chroot /mnt /bin/bash
```
