# blacklist watchdog
sudo vim /etc/modprobe.d/blacklist.conf
  install iTCO_wdt /bin/true

# disable pc speaker
sudo vim /etc/modprobe.d/nobeep.conf
  # Do not load the 'pcspkr' module on boot.
  blacklist pcspkr

# pam, add the uncommented lines
sudo vim /etc/pam.d/login
#auth       required     pam_securetty.so
#auth       requisite    pam_nologin.so
#auth       include      system-local-login
auth       optional     pam_gnome_keyring.so
#account    include      system-local-login
#session    include      system-local-login
session    optional     pam_gnome_keyring.so auto_start