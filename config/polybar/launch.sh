#!/bin/bash

# Matar instancias previas
killall -q polybar

# Esperar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Lanzar polybar
polybar main -c $HOME/.config/polybar/config.ini &

echo "Polybar launched"
