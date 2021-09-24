#!/bin/bash

function powernenu {
	options="Cancel\nPoweroff\nReboot\nLock"
	selected=$(echo -e $options | dmenu)
	if [[ $selected = "Poweroff" ]]; then
		poweroff	
	if [[ $selected = "Reboot" ]]; then
		reboot
	if [[ $selected = "Lock" ]]; then
		slock
	if [[ $selected = "Cancel" ]]; then
		return
	fi
}

powermenu

