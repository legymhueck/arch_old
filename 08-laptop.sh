doas pacman -S --noconfirm tlp tlp-rdw
doas systemctl enable tlp.service --now
doas systemctl enable NetworkManager-dispatcher.service --now
# check: doas tlp-stat
