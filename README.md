# 🔐 BSPWM Professional Pentesting Environment for Kali Linux

![S4vitar Style](https://img.shields.io/badge/Style-S4vitar-d81b60?style=for-the-badge)
![Resolution](https://img.shields.io/badge/Resolution-1920x1080-blue?style=for-the-badge)
![Kali Linux](https://img.shields.io/badge/OS-Kali%20Linux-red?style=for-the-badge)

Un entorno de escritorio profesional con BSPWM optimizado para pentesting, basado en el estilo de s4vitar/eriic1002.

## 📸 Preview

El entorno incluye:
- 🎯 **Target IP Display** - Muestra la IP del objetivo actual
- 🌐 **Ethernet Status** - IP de eth0 en tiempo real
- 🔒 **VPN Status** - Estado de conexión tun0
- 💻 **CPU, RAM, Disk** - Monitores del sistema
- 🔢 **Workspaces I-X** - Estilo romano
- ⚡ **Powermenu** - Menú de apagado con rofi

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
| `Super + Ctrl + Alt + (←↓↑→)` | Redimensionar con script |

### Subventanas (Kitty)
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
| `Super + Ctrl + Space` | Cancelar preselección |

### Sistema
| Atajo | Acción |
|-------|--------|
| `Super + Alt + R` | Reiniciar bspwm |
| `Super + Alt + Q` | Cerrar sesión |
| `Ctrl + Alt + L` | Bloquear pantalla |
| `Super + X` | Menú de apagado (Powermenu) |

### Audio/Media
| Atajo | Acción |
|-------|--------|
| `Ctrl + Shift + (+/-)` | Subir/bajar volumen |
| `Ctrl + Shift + M` | Mute/unmute |
| `XF86Audio*` | Teclas multimedia |

### Screenshots
| Atajo | Acción |
|-------|--------|
| `Print` | Screenshot completo |
| `Super + Print` | Screenshot selección |

## 🎯 Funciones de Pentesting (ZSH)

### Target Management
```bash
# Establecer IP objetivo (se muestra en polybar)
set_target 10.10.10.100

# Limpiar target
clear_target
```

### Funciones Útiles
| Comando | Descripción |
|---------|-------------|
| `mkt` | Crear estructura de directorios (nmap, content, exploits, scripts) |
| `extract_ports <file>` | Extrae puertos de archivo grepeable de nmap |
| `set_target <IP>` | Establece IP objetivo (muestra en polybar) |
| `clear_target` | Limpia IP objetivo |

### Aliases Principales
| Alias | Descripción |
|-------|-------------|
| `ll` | `lsd -lh --group-dirs=first` |
| `la` | `lsd -a --group-dirs=first` |
| `l` | `lsd --group-dirs=first` |
| `lla` | `lsd -lha --group-dirs=first` |
| `ls` | `lsd --group-dirs=first` |
| `cat` | `bat` |
| `catn` | `/bin/cat` |
| `catnl` | `bat --style=plain` |

## 📁 Estructura de Archivos

```
~/.config/
├── bspwm/
│   ├── bspwmrc              # Configuración de bspwm
│   └── scripts/
│       ├── ethernet_status.sh   # Script IP ethernet
│       ├── vpn_status.sh        # Script estado VPN
│       ├── target_ip_status.sh  # Script IP objetivo
│       ├── target_ip            # Archivo con IP objetivo
│       └── bspwm_resize         # Script de redimensionado
├── sxhkd/
│   └── sxhkdrc              # Atajos de teclado
├── polybar/
│   ├── colors.ini           # Paleta de colores
│   ├── current.ini          # Barras principales
│   ├── workspace.ini        # Barra de workspaces
│   ├── launch.sh            # Script de lanzamiento
│   └── scripts/
│       ├── powermenu        # Script powermenu
│       ├── style-3.rasi     # Estilo powermenu
│       └── shared/
│           └── confirm.rasi # Diálogo confirmación
├── kitty/
│   ├── kitty.conf           # Configuración terminal
│   └── color.ini            # Colores de terminal
├── rofi/
│   ├── config.rasi          # Configuración rofi
│   └── themes/
│       ├── rounded-common.rasi  # Tema base
│       └── rounded-custom.rasi  # Colores personalizados
├── picom/
│   └── picom.conf           # Compositor (transparencias)
└── zshrc                    # Configuración ZSH

~/wallpapers/
└── *.jpg                    # Wallpapers
```

## 🎨 Colores del Tema

| Color | Hex | Uso |
|-------|-----|-----|
| Background | `#99000000` | Fondo de barras (transparente) |
| Pink | `#d81b60` | Acentos y bordes activos |
| White | `#FFFFFF` | Texto principal |
| Grey | `#919191` | Texto secundario |
| Red | `#FF0000` | Alertas/Errores |
| Green | `#29d607` | VPN conectado |

## 🔧 Personalización

### Cambiar wallpaper
```bash
# Editar bspwmrc y cambiar la línea de feh
nano ~/.config/bspwm/bspwmrc

# O usar feh directamente
feh --bg-fill /ruta/al/wallpaper.jpg
```

### Editar polybar
```bash
# Colores
nano ~/.config/polybar/colors.ini

# Barras
nano ~/.config/polybar/current.ini
nano ~/.config/polybar/workspace.ini

# Reiniciar polybar
~/.config/polybar/launch.sh
```

### Editar kitty
```bash
nano ~/.config/kitty/kitty.conf
nano ~/.config/kitty/color.ini
```

### Editar atajos
```bash
nano ~/.config/sxhkd/sxhkdrc
```

## 💡 Tips

1. **Target IP**: Usa `set_target <IP>` para que aparezca en la polybar
2. **VPN Indicator**: Muestra el estado de tun0 en tiempo real
3. **Screenshots**: Se guardan en `~/Pictures/`
4. **Powermenu**: `Super + X` abre el menú de apagado

## 🐛 Solución de Problemas

### Polybar no aparece
```bash
# Reiniciar polybar manualmente
~/.config/polybar/launch.sh
```

### Barras desaparecen al cambiar workspace
```bash
# Verificar que picom tenga esta configuración
grep "mark-ovredir-focused" ~/.config/picom/picom.conf
# Debe ser: mark-ovredir-focused = false
```

### Fuentes no se muestran bien
```bash
fc-cache -fv
```

### Picom causa lag (en VM)
Edita `~/.config/picom/picom.conf` y asegúrate de tener:
```
backend = "xrender"
vsync = false
```

## 📝 Créditos

- Estilo basado en: [eriic1002/kali-environment-autoinstaller](https://github.com/eriic1002/kali-environment-autoinstaller)
- Inspirado en el entorno de: [s4vitar](https://github.com/s4vitar)

---

**Resolución optimizada**: 1920x1080
