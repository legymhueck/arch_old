# pam, add the uncommented lines
sudo vim /etc/pam.d/login
#auth       required     pam_securetty.so
#auth       requisite    pam_nologin.so
#auth       include      system-local-login
auth       optional     pam_gnome_keyring.so
#account    include      system-local-login
#session    include      system-local-login
session    optional     pam_gnome_keyring.so auto_start