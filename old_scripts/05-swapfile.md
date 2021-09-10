# swapfile

```bash
truncate -s 0 /swap/swapfile
chattr +C /swap/swapfile
btrfs property set /swapfile compression none
dd if=/dev/zero of=/swap/swapfile bs=1G count=2
chmod 600 /swap/swapfile
mkswap /swap/swapfile
swapon /swap/swapfile

nano /etc/fstab
/swap/swapfile none swap defaults 0 0

nano /etc/sysctl.d/99-swappiness.conf
vm.swappiness=10
```
