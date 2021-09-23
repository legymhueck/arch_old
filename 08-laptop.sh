sudo pacman -S --noconfirm tlp tlp-rdw
sudo systemctl enable tlp.service --now
sudo systemctl enable NetworkManager-dispatcher.service --now
# check: doas tlp-stat
