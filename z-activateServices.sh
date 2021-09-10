# Nextcloud
#echo "Nextcloud"
#sudo pacman -S --needed --noconfirm nextcloud nextcloud-client nextcloud-app-tasks nextcloud-app-spreed
#sudo pacman -S --needed --noconfirm nextcloud-app-notes nextcloud-app-mail nextcloud-app-contacts
#sudo pacman -S --needed --noconfirm nextcloud-app-calendar nextcloud-app-bookmarks

# Keyboard shortcuts dwm
#echo "Keyboard shortcuts dwm"
#sudo pacman -S --needed --noconfirm sxhkd

# Firewall
echo "Firewall"
sudo pacman -S --needed --noconfirm firewalld ipset ebtables
sudo systemctl enable --now firewalld
# in a browser, open 'localhost:9090'

# Firewalld rules
sudo firewall-cmd --add-service libvirt --zone=libvirt --permanent
sudo firewall-cmd --add-port=1025-65535/tcp --zone=libvirt --permanent
sudo firewall-cmd --add-port=1025-65535/udp --zone=libvirt --permanent
sudo firewall-cmd --permanent --zone=public --add-port=5353/udp
sudo firewall-cmd --reload

# Cockpit
#sudo pacman -S --needed --noconfirm cockpit packagekit
#sudo systemctl enable --now cockpit.socket

# Activating services
echo "Activating services"
sudo systemctl enable fstrim.timer

sudo gpasswd -a michael libvirt
sudo gpasswd -a michael kvm
