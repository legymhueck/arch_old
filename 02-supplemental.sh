#!/bin/bash
#set -e

func_install() {
    if pacman -Qi "$1" &>/dev/null; then
        tput setaf 2
        echo "The package '$1' is already installed"
        echo
        tput sgr0
    else
        tput setaf 3
        echo "Installing package " "$1"
        echo
        tput sgr0
        sudo pacman -S --noconfirm --needed "$1"
    fi
}

list=(
    android-file-transfer
    android-tools
    android-udev
    aria2
    aspell
    aspell-de
    aspell-en
    audacity
    bless
    bridge-utils
    broadcom-wl
    catfish
    cups
    cups-pdf
    discord
    dmidecode
    dnsmasq
    dunst
    doublecmd-gtk2
    epdfview
    evince
    feh
    foomatic-db
    foomatic-db-engine
    foomatic-db-gutenprint-ppds
    foomatic-db-nonfree
    foomatic-db-nonfree-ppds
    geeqie
    ghostscript
    gimagereader-gtk
    gimp
    gpart gparted
    gpicview
    gsfonts
    gst-libav
    gst-plugins-bad
    gst-plugins-base
    gst-plugins-good
    gst-plugins-ugly
    gtk3-print-backends
    handbrake
    hunspell
    hunspell-de
    hunspell-en_GB
    hunspell-en_US
    hyphen
    hyphen-de
    hyphen-en
    imagemagick
    img2pdf
    iptables-nft
    l3afpad
    libcups
    libdvdcss
    libreoffice-fresh
    libunrar
    libva-intel-driver
    libva-mesa-driver
    libvirt
    lm_sensors
    lsof
    lxappearance-gtk3
    mc
    mediathek
    meld
    mpv
    mupdf
    network-manager-applet
    nm-connection-editor
    notepadqq
    obs-studio
    okular
    openbsd-netcat
    osdbattery
    ovmf
    p7zip
    plocate
    python-pip
    qemu
    qemu-arch-extra
    ristretto
    rofi
    rsync
    screen
    simple-scan
    simplescreenrecorder
    splix gutenprint
    swtpm
    sxiv
    system-config-printer
    tesseract
    tesseract-data-eng
    unzip
    upower
    veracrypt
    virt-manager
    virt-viewer
    vlc
    wpa_supplicant
    xpdf
    youtube-dl
)

for name in "${list[@]}"; do
    tput setaf 3 # colors
    echo "Installing $name"
    tput sgr0 # colors
    func_install "$name"
done
