#echo "aur packages"
#paru -S --needed --noconfirm ventoy-bin filius jetbrains-toolbox spotify ttf-ms-fonts liberica-jdk-11-full-bin
#paru -S --needed --noconfirm brave-bin simplenote-electron-bin bitwarden-bin breeze-red-cursor-theme
#paru -S --needed --noconfirm breeze-red-cursor-theme chaotic-mirrorlist chaotic-keyring gimagereader

# youtube-viewer
gpg2 --keyserver keyserver.ubuntu.com --receive-keys ABB8BBAA2E279767774149B7D0A443C703A3A056

curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | gpg --import -

TEMP_DIR=$(mktemp -d)

while read AUR_PKG
do
  if ! pacman -Q ${AUR_PKG} > /dev/null; then
    cd $TEMP_DIR
    git clone https://aur.archlinux.org/${AUR_PKG}.git
    cd ${AUR_PKG} && makepkg -si --noconfirm && cd $TEMP_DIR
  fi
done < packages-aur.txt
