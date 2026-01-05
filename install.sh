#!/bin/bash

#####################################################
#   BSPWM Cyberpunk Environment - Auto Installer    #
#   Para Kali Linux - Resolución 1920x1080          #
#####################################################

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Banner
echo -e "${PURPLE}"
cat << "EOF"
  ____  ____  ______        ____  __ 
 | __ )/ ___||  _ \ \      / /  \/  |
 |  _ \\___ \| |_) \ \ /\ / /| |\/| |
 | |_) |___) |  __/ \ V  V / | |  | |
 |____/|____/|_|     \_/\_/  |_|  |_|
                                      
   Cyberpunk Environment Installer
   For Kali Linux - 1920x1080
EOF
echo -e "${NC}"

# Verificar si se ejecuta como root
if [[ $EUID -eq 0 ]]; then
   echo -e "${RED}[!] No ejecutes este script como root${NC}"
   exit 1
fi

# Directorio del usuario
USER_HOME=$HOME
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo -e "${CYAN}[*] Actualizando repositorios...${NC}"
sudo apt update

echo -e "${CYAN}[*] Instalando dependencias principales...${NC}"
sudo apt install -y \
    bspwm \
    sxhkd \
    polybar \
    rofi \
    kitty \
    picom \
    feh \
    dunst \
    lxappearance \
    papirus-icon-theme \
    neofetch \
    htop \
    ranger \
    bat \
    exa \
    fzf \
    zsh \
    curl \
    wget \
    git \
    unzip \
    xclip \
    scrot \
    imagemagick \
    pulseaudio-utils \
    brightnessctl \
    network-manager \
    wireless-tools \
    acpi \
    jq \
    xdotool \
    wmctrl \
    firefox-esr \
    thunar \
    lxpolkit \
    i3lock \
    xterm

# Verificar que kitty está instalado
if ! command -v kitty &> /dev/null; then
    echo -e "${YELLOW}[+] Kitty no encontrado, instalando...${NC}"
    # Intentar instalar desde repos primero
    sudo apt install -y kitty 2>/dev/null
    
    # Si aún no está, instalar desde binarios
    if ! command -v kitty &> /dev/null; then
        echo -e "${YELLOW}[+] Instalando kitty desde binarios...${NC}"
        curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin launch=n
        mkdir -p ~/.local/bin
        ln -sf ~/.local/kitty.app/bin/kitty ~/.local/bin/
        ln -sf ~/.local/kitty.app/bin/kitten ~/.local/bin/
        
        # Crear desktop entry
        mkdir -p ~/.local/share/applications
        cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
        sed -i "s|Icon=kitty|Icon=$HOME/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty.desktop
    fi
fi

echo -e "${GREEN}[+] Kitty: $(which kitty 2>/dev/null || echo 'instalado en ~/.local/bin')${NC}"

# Instalar Burpsuite si no está instalado
if ! command -v burpsuite &> /dev/null; then
    echo -e "${CYAN}[*] Instalando Burpsuite...${NC}"
    sudo apt install -y burpsuite
fi

echo -e "${CYAN}[*] Instalando Nerd Fonts...${NC}"
FONTS_DIR="$USER_HOME/.local/share/fonts"
mkdir -p "$FONTS_DIR"

# Descargar JetBrains Mono Nerd Font
if [ ! -f "$FONTS_DIR/JetBrainsMonoNerdFont-Regular.ttf" ]; then
    echo -e "${YELLOW}[+] Descargando JetBrains Mono Nerd Font...${NC}"
    cd /tmp
    wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
    unzip -o JetBrainsMono.zip -d JetBrainsMono
    cp JetBrainsMono/*.ttf "$FONTS_DIR/"
    rm -rf JetBrainsMono JetBrainsMono.zip
fi

# Descargar Hack Nerd Font
if [ ! -f "$FONTS_DIR/HackNerdFont-Regular.ttf" ]; then
    echo -e "${YELLOW}[+] Descargando Hack Nerd Font...${NC}"
    cd /tmp
    wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.zip
    unzip -o Hack.zip -d Hack
    cp Hack/*.ttf "$FONTS_DIR/"
    rm -rf Hack Hack.zip
fi

# Descargar Iosevka Nerd Font
if [ ! -f "$FONTS_DIR/IosevkaNerdFont-Regular.ttf" ]; then
    echo -e "${YELLOW}[+] Descargando Iosevka Nerd Font...${NC}"
    cd /tmp
    wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Iosevka.zip
    unzip -o Iosevka.zip -d Iosevka
    cp Iosevka/*.ttf "$FONTS_DIR/"
    rm -rf Iosevka Iosevka.zip
fi

# Actualizar caché de fuentes
fc-cache -fv

echo -e "${CYAN}[*] Creando estructura de directorios...${NC}"
mkdir -p "$USER_HOME/.config/bspwm"
mkdir -p "$USER_HOME/.config/sxhkd"
mkdir -p "$USER_HOME/.config/polybar/scripts"
mkdir -p "$USER_HOME/.config/rofi/themes"
mkdir -p "$USER_HOME/.config/kitty"
mkdir -p "$USER_HOME/.config/picom"
mkdir -p "$USER_HOME/.config/dunst"
mkdir -p "$USER_HOME/.config/neofetch"
mkdir -p "$USER_HOME/wallpapers"
mkdir -p "$USER_HOME/.local/bin"

echo -e "${CYAN}[*] Copiando archivos de configuración...${NC}"

# Copiar configuraciones
cp -r "$SCRIPT_DIR/config/bspwm/"* "$USER_HOME/.config/bspwm/"
cp -r "$SCRIPT_DIR/config/sxhkd/"* "$USER_HOME/.config/sxhkd/"
cp -r "$SCRIPT_DIR/config/polybar/"* "$USER_HOME/.config/polybar/"
cp -r "$SCRIPT_DIR/config/rofi/"* "$USER_HOME/.config/rofi/"
cp -r "$SCRIPT_DIR/config/kitty/"* "$USER_HOME/.config/kitty/"
cp -r "$SCRIPT_DIR/config/picom/"* "$USER_HOME/.config/picom/"
cp -r "$SCRIPT_DIR/config/dunst/"* "$USER_HOME/.config/dunst/"
cp -r "$SCRIPT_DIR/config/neofetch/"* "$USER_HOME/.config/neofetch/"

# Copiar scripts
cp "$SCRIPT_DIR/scripts/"* "$USER_HOME/.local/bin/"

# Copiar wallpapers
cp "$SCRIPT_DIR/"*.jpg "$USER_HOME/wallpapers/" 2>/dev/null || true
echo -e "${GREEN}[+] Wallpapers copiados${NC}"

# Hacer ejecutables los scripts
chmod +x "$USER_HOME/.config/bspwm/bspwmrc"
chmod +x "$USER_HOME/.config/polybar/launch.sh"
chmod +x "$USER_HOME/.config/polybar/scripts/"* 2>/dev/null
chmod +x "$USER_HOME/.local/bin/"* 2>/dev/null

echo -e "${CYAN}[*] Configurando ZSH y Powerlevel10k...${NC}"

# Instalar Oh My Zsh si no está instalado
if [ ! -d "$USER_HOME/.oh-my-zsh" ]; then
    echo -e "${YELLOW}[+] Instalando Oh My Zsh...${NC}"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Instalar Powerlevel10k
ZSH_CUSTOM="${ZSH_CUSTOM:-$USER_HOME/.oh-my-zsh/custom}"
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
    echo -e "${YELLOW}[+] Instalando Powerlevel10k...${NC}"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
fi

# Instalar plugins de zsh
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo -e "${YELLOW}[+] Instalando zsh-autosuggestions...${NC}"
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    echo -e "${YELLOW}[+] Instalando zsh-syntax-highlighting...${NC}"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

# Copiar configuración de zsh
echo -e "${YELLOW}[+] Configurando .zshrc...${NC}"
cp "$SCRIPT_DIR/config/zshrc" "$USER_HOME/.zshrc"
cp "$SCRIPT_DIR/config/p10k.zsh" "$USER_HOME/.p10k.zsh"

echo -e "${CYAN}[*] Configurando shell por defecto...${NC}"
chsh -s $(which zsh)

echo -e "${GREEN}"
cat << "EOF"
╔═══════════════════════════════════════════════════════════╗
║                                                           ║
║   ¡Instalación completada!                                ║
║                                                           ║
║   Reinicia tu sesión y selecciona BSPWM                   ║
║   en el gestor de inicio de sesión.                       ║
║                                                           ║
║   Shortcuts principales:                                  ║
║   • Super + Enter     → Terminal (kitty)                  ║
║   • Super + D         → Rofi launcher                     ║
║   • Super + W         → Cerrar ventana                    ║
║   • Super + Alt + R   → Reiniciar bspwm                   ║
║   • Super + Shift + S → Cambiar estilo                    ║
║                                                           ║
╚═══════════════════════════════════════════════════════════╝
EOF
echo -e "${NC}"

echo -e "${YELLOW}[!] Ejecuta 'reboot' o cierra sesión para aplicar los cambios${NC}"
