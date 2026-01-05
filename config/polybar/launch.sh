#!/bin/bash

# Matar instancias previas
killall -q polybar

# Esperar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Lanzar las 3 barras del tema Lain
polybar lain-bar -c $HOME/.config/polybar/config.ini &
polybar lain-bar2 -c $HOME/.config/polybar/config.ini &
polybar lain-bar3 -c $HOME/.config/polybar/config.ini &

echo "Polybar Lain theme launched"
