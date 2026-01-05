#!/bin/bash

#####################################################
#              Power Menu - Rofi                    #
#####################################################

# Opciones
shutdown="󰐥 Apagar"
reboot="󰜉 Reiniciar"
lock="󰌾 Bloquear"
logout="󰍃 Cerrar sesión"

# Mostrar menú
selected=$(echo -e "$lock\n$logout\n$reboot\n$shutdown" | rofi -dmenu -i -p "Power")

# Ejecutar acción
case $selected in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        i3lock -c 1a1b26
        ;;
    $logout)
        bspc quit
        ;;
esac
