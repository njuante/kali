#!/bin/bash

#####################################################
#              Power Menu (Rofi)                    #
#####################################################

# Options
shutdown=" Shutdown"
reboot=" Reboot"
lock=" Lock"
suspend="󰤄 Suspend"
logout="󰍃 Logout"

# Get answer
answer=$(echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi -dmenu -i -theme ~/.config/rofi/themes/cyberpunk.rasi -p "Power Menu")

case $answer in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        betterlockscreen -l 2>/dev/null || i3lock -c 1a1b26
        ;;
    $suspend)
        systemctl suspend
        ;;
    $logout)
        bspc quit
        ;;
esac
