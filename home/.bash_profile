#!/bin/bash

# Environment variables set everywhere
export PATH="$PATH:$HOME/.config/dwmblocks/scripts"
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"
export PDF="mupdf"
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
export PATH="${PATH}:${HOME}/.local/bin"
export PATH="${PATH}:/$HOME/.config/scripts"

# For QT Themes
#export QT_QPA_PLATFORMTHEME=qt5ct

# XDG Paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# zsh config dir
# export ZDOTDIR=$HOME/.config/zsh
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

#if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#  exec startx
#fi
# or (Luke)
#if [ "($tty)" = "/dev/tty1" ]; then
#    pgrep -x dwm  || exec startx
#fi

# Color scheme
# wal -Rn >/dev/null
