# btrfs mount
ˋUUID=... / btrfs rw,noatime,compress=zstd:1, ssd,space_cache,discard=async,subvolid=256,subvol=/@ 0 0

# btrfsMinimal

A minimal btrfs install, encrypted, grub, bios & uefi

Old .xinitrc commands
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
systemctl --user import-environment DISPLAY XAUTHORITY
if command -v dbus-update-activation-environment >/dev/null 2>&1; then
    dbus-update-activation-environment DISPLAY XAUTHORITY
fi

# gnome-keyring-daemon (arch linux wiki)
if [ -f /usr/bin/gnome-keyring-daemon ]; then
  eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
  export SSH_AUTH_SOCK
fi

# Polkit
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Dbus fix
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
  eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi
