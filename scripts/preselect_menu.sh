#!/bin/bash

#####################################################
#              Preselect Menu                       #
#####################################################

# Apps for preselection
apps="󰆍 Terminal (kitty)
󰈹 Firefox
󰉋 File Manager
󱃾 Burpsuite
󰨞 VS Code
󰝚 Spotify"

# Select app
selected=$(echo -e "$apps" | rofi -dmenu -i -p "Open App")

case "$selected" in
    "󰆍 Terminal (kitty)")
        kitty &
        ;;
    "󰈹 Firefox")
        firefox-esr &
        ;;
    "󰉋 File Manager")
        thunar &
        ;;
    "󱃾 Burpsuite")
        burpsuite &
        ;;
    "󰨞 VS Code")
        code &
        ;;
    "󰝚 Spotify")
        spotify &
        ;;
esac
