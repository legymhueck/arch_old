vim /etc/X11/xorg.conf.d/00-keyboard.conf
Section "InputClass"
Identifier "system-keyboard"
MatchIsKeyboard "on"
Option "XkbLayout" "de"
Option "XkbModel" "pc105"
Option "XkbVariant" ""
Option "XkbOptions" "terminate:ctrl_alt_bksp"
EndSection