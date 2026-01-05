#!/bin/bash

#####################################################
#   Actualizar configuración de BSPWM               #
#####################################################

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo -e "${CYAN}[*] Actualizando configuraciones...${NC}"

# Crear directorios necesarios
mkdir -p ~/.config/rofi/themes
mkdir -p ~/.local/bin
mkdir -p ~/Pictures

# Copiar configuraciones
cp -r "$SCRIPT_DIR/config/bspwm/"* ~/.config/bspwm/
cp -r "$SCRIPT_DIR/config/sxhkd/"* ~/.config/sxhkd/
cp -r "$SCRIPT_DIR/config/polybar/"* ~/.config/polybar/
cp -r "$SCRIPT_DIR/config/rofi/"* ~/.config/rofi/
cp -r "$SCRIPT_DIR/config/kitty/"* ~/.config/kitty/
cp -r "$SCRIPT_DIR/config/picom/"* ~/.config/picom/

# Copiar scripts
cp "$SCRIPT_DIR/scripts/"* ~/.local/bin/

# Permisos
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/polybar/launch.sh
chmod +x ~/.local/bin/*

echo -e "${GREEN}[+] Configuraciones actualizadas${NC}"
echo -e "${YELLOW}[!] Ejecuta: bspc wm -r${NC}"
echo -e "${YELLOW}[!] O presiona Super + Alt + R${NC}"
