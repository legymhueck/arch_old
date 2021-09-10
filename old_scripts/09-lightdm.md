sudo pacman -S --needed --noconfirm lightdm lightdm-greeter

sudo mkdir /usr/share/xsessions

sudo vim dwm.desktop
[Desktop Entry]
Encoding=UTF-8
Name=DWM
Comment=Dynamic window manager
Exec=dwm
Icon=dwm
Type=XSession

cd ~/.config/dwm
sudo make clean install

cd ../slstatus
sudo make clean install

sudo systemctl enable lightdm
sudo systemctl restart --now lightdm

sudo groupadd -r autologin
sudo gpasswd -a michael autologin

sudo vim /etc/lightdm/lightdm.conf
[Seat:*]
autologin-user=michael
autologin-session=dwm

/etc/X11/xorg.conf.d/00-keyboard.conf
Section "InputClass"
        Identifier "system-keyboard"
        MatchIsKeyboard "on"
        Option "XkbLayout" "de"
        Option "XkbVariant" "deadgraveacute"
EndSection

vim .xprofile
xrandr --output Virtual-1 --mode 1920x1200