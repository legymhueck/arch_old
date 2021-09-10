# blacklist watchdog
sudo vim /etc/modprobe.d/blacklist.conf
  install iTCO_wdt /bin/true

# disable pc speaker
sudo vim /etc/modprobe.d/nobeep.conf
  # Do not load the 'pcspkr' module on boot.
  blacklist pcspkr