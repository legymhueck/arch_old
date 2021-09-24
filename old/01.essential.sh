# requires doas
doas pacman -S --needed --noconfirm $(<packages-essential.txt)
# doas pacman -S - < packages-essential.txt --needed --noconfirm
