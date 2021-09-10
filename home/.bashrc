# Disable ctrl-s (pauses the terminal) and you have to press ctrl-q to get out of ot
stty -ixon
#
# ~/.bashrc
#

# If not running interactively, don't do anything

[[ $- != *i* ]] && return
[[ -f ~/.bashrc-personal ]] && . ~/.bashrc-personal