# tty1 autologin

systemctl edit getty@tty1

[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin michael --noclear %I $TERM


# Lightdm Autologin

groupadd -r autologin
gpasswd -a michael autologin

vim /etc/lightdm/lightdm.conf
[Seat:*]
autologin-user=michael

