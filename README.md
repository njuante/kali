# 🌌 BSPWM Cyberpunk Environment for Kali Linux

![Cyberpunk Theme](https://img.shields.io/badge/Theme-Cyberpunk-purple?style=for-the-badge)
![Resolution](https://img.shields.io/badge/Resolution-1920x1080-blue?style=for-the-badge)
![Kali Linux](https://img.shields.io/badge/OS-Kali%20Linux-red?style=for-the-badge)

Un entorno de escritorio profesional y estético con BSPWM optimizado para pentesting y uso diario.

## 📸 Screenshots

La polybar incluye:
- 🖥️ CPU, RAM, Almacenamiento
- � WiFi con señal
- 🔊 Control de volumen
- 🕐 Fecha y hora
- 🔢 Workspaces con números

## 🚀 Instalación

### Requisitos previos
- Kali Linux instalado
- Conexión a internet
- Usuario no root

### Instalación automática

```bash
# Clona o copia los archivos a tu directorio
cd ~/

# Da permisos de ejecución al instalador
chmod +x install.sh

# Ejecuta el instalador
./install.sh

# Reinicia tu sistema
reboot
```

Al reiniciar, selecciona **BSPWM** en el gestor de inicio de sesión.

## ⌨️ Atajos de Teclado

### Aplicaciones
| Atajo | Acción |
|-------|--------|
| `Super + Enter` | Terminal (kitty) |
| `Super + D` | Rofi (launcher) |
| `Super + Shift + Return` | Firefox |
| `Super + Shift + B` | Burpsuite |
| `Super + E` | Thunar (explorador) |

### Gestión de Ventanas
| Atajo | Acción |
|-------|--------|
| `Super + W` | Cerrar ventana |
| `Super + T` | Modo tile |
| `Super + S` | Modo floating |
| `Super + F` | Modo fullscreen |
| `Super + M` | Toggle monocle |

### Navegación
| Atajo | Acción |
|-------|--------|
| `Super + (1-9,0)` | Ir a workspace |
| `Super + Shift + (1-9,0)` | Mover ventana a workspace |
| `Super + (←↓↑→)` | Navegar entre ventanas |
| `Super + Shift + (←↓↑→)` | Mover ventana |

### Redimensionar
| Atajo | Acción |
|-------|--------|
| `Super + Alt + (←↓↑→)` | Expandir ventana |
| `Super + Shift + R` | Modo resize (W/N/T/S/R) |

### Subventanas
| Atajo | Acción |
|-------|--------|
| `Ctrl + Shift + Enter` | Abrir subventana |
| `Ctrl + Shift + Z` | Zoom en subventana |
| `Ctrl + (←↓↑→)` | Navegar subventanas |
| `Ctrl + Shift + L` | Toggle layout |
| `Ctrl + Shift + W` | Cerrar subventana |

### Preselección
| Atajo | Acción |
|-------|--------|
| `Super + Ctrl + (←↓↑→)` | Preseleccionar dirección |
| `Super + Ctrl + Alt + (←↓↑→)` | Menú preselección |
| `Super + Ctrl + Space` | Cancelar preselección |

### Sistema
| Atajo | Acción |
|-------|--------|
| `Super + Alt + R` | Reiniciar bspwm |
| `Super + Alt + Q` | Cerrar sesión |
| `Ctrl + Alt + L` | Bloquear pantalla |
| `Super + X` | Menú de apagado |

### Audio/Media
| Atajo | Acción |
|-------|--------|
| `Ctrl + Shift + (+/-)` | Subir/bajar volumen |
| `Ctrl + Shift + M` | Mute/unmute |
| `XF86Audio*` | Teclas multimedia |

### Extras
| Atajo | Acción |
|-------|--------|
| `Super + Shift + S` | Cambiar tema/estilo |
| `Super + (-)` | Terminal scratchpad |
| `Print` | Screenshot completo |
| `Super + Print` | Screenshot selección |

## 🎨 Temas Incluidos

Usa `Super + Shift + S` para cambiar entre:
- 🌌 **Cyberpunk** (Default)
- 🌙 **Tokyo Night**
- 🔥 **Dracula**
- 🌿 **Nord**
- 🌊 **Catppuccin**
- 🎨 **Gruvbox**

## 📁 Estructura de Archivos

```
~/.config/
├── bspwm/
│   └── bspwmrc          # Configuración de bspwm
├── sxhkd/
│   └── sxhkdrc          # Atajos de teclado
├── polybar/
│   ├── config.ini       # Configuración de polybar
│   ├── launch.sh        # Script de lanzamiento
│   └── scripts/         # Scripts de módulos
├── kitty/
│   └── kitty.conf       # Configuración terminal
├── rofi/
│   ├── config.rasi      # Configuración rofi
│   └── themes/          # Temas de rofi
├── picom/
│   └── picom.conf       # Compositor (transparencias)
├── dunst/
│   └── dunstrc          # Notificaciones
└── neofetch/
    └── config.conf      # Neofetch config

~/.local/bin/
├── powermenu.sh         # Menú de apagado
├── style_changer.sh     # Cambiar temas
├── scratchpad.sh        # Terminal scratchpad
└── ...                  # Otros scripts

~/wallpapers/
└── cyberpunk.jpg        # Wallpaper
```

## 🔧 Personalización

### Cambiar wallpaper
```bash
feh --bg-fill /ruta/al/wallpaper.jpg
```

### Editar polybar
```bash
nano ~/.config/polybar/config.ini
~/.config/polybar/launch.sh
```

### Editar kitty
```bash
nano ~/.config/kitty/kitty.conf
```

### Editar atajos
```bash
nano ~/.config/sxhkd/sxhkdrc
```

## 💡 Tips

1. **VPN Indicator**: La polybar muestra el estado de la VPN (tun0/tap0)
2. **Screenshots**: Se guardan en `~/Pictures/Screenshots/`
3. **Scratchpad**: Terminal flotante con `Super + -`

## 🔍 Comandos de Reconocimiento (ZSH)

### Funciones Principales
| Comando | Descripción |
|---------|-------------|
| `ctf <nombre>` | Crea estructura de directorios para CTF |
| `recon <IP>` | Escaneo completo de nmap (puertos + servicios) |
| `quickscan <IP>` | Escaneo rápido nmap |
| `udpscan <IP>` | Escaneo UDP top 50 puertos |
| `webrecon <URL>` | Reconocimiento web (whatweb + gobuster) |
| `revshell [IP] [PORT]` | Genera reverse shells (bash, python, nc, php, powershell) |
| `ttyupgrade` | Muestra comandos para upgrader TTY |
| `listen [PORT]` | Inicia listener netcat (default 4444) |
| `cpip` | Copia IP de tun0 al portapapeles |
| `enum-smb <IP>` | Ejecuta enum4linux completo |
| `peas-server [PORT]` | Sirve LinPEAS/WinPEAS |

### Aliases de Nmap
| Alias | Comando |
|-------|---------|
| `nmap-quick` | `nmap -sC -sV -O -T4` |
| `nmap-full` | `nmap -sC -sV -O -p- -T4` |
| `nmap-udp` | `sudo nmap -sU --top-ports 100 -T4` |
| `nmap-vuln` | `nmap --script vuln -T4` |
| `nmap-stealth` | `sudo nmap -sS -T2` |

### Aliases de Web
| Alias | Descripción |
|-------|-------------|
| `gobuster-dir` | Dirbusting con wordlist medium |
| `gobuster-vhost` | Enumeración de virtual hosts |
| `ffuf-dir` | Fuzzing de directorios |
| `nikto-scan` | Escaneo Nikto |
| `wpscan-enum` | Enumeración WordPress |

### Aliases de SMB/LDAP
| Alias | Descripción |
|-------|-------------|
| `smb-enum` | enum4linux -a |
| `smb-shares` | smbclient -L |
| `smb-map` | smbmap -H |
| `ldap-search` | ldapsearch básico |

### Servidores Rápidos
| Alias | Descripción |
|-------|-------------|
| `serv` | Python HTTP server puerto 80 |
| `serv8000` | Python HTTP server puerto 8000 |
| `smb-server` | SMB server con impacket |

## 🐛 Solución de Problemas

### Polybar no aparece
```bash
~/.config/polybar/launch.sh
```

### Fuentes no se muestran bien
```bash
fc-cache -fv
```

### Picom causa lag
Edita `~/.config/picom/picom.conf` y cambia `backend = "glx"` a `backend = "xrender"`

## 📝 Licencia

Este proyecto es de uso libre. ¡Disfruta tu nuevo entorno!

---

**Autor**: Configuración automática generada para Kali Linux
**Resolución optimizada**: 1920x1080
