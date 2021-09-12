# sudo echo "permit nopass keepenv :wheel" > /etc/doas.conf
sudo su
echo "permit persist :wheel" > /etc/doas.conf
echo "permit nopass :plugdev as root cmd /usr/bin/smartctl" >> /etc/doas.conf
chown -c root:root /etc/doas.conf
chmod -c 0400 /etc/doas.conf

# check if config is ok
doas -C /etc/doas.conf && echo "config ok" || echo "config error"