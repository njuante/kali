#!/bin/bash

#####################################################
#              Style Changer                        #
#####################################################

# Available styles
styles="🌌 Cyberpunk (Default)
🌙 Tokyo Night
🔥 Dracula
🌿 Nord
🌊 Catppuccin
🎨 Gruvbox"

# Select style
selected=$(echo -e "$styles" | rofi -dmenu -i -p "Select Theme")

case "$selected" in
    "🌌 Cyberpunk (Default)")
        # Colors
        BG="#1a1b26"
        BG_ALT="#24283b"
        FG="#c0caf5"
        PRIMARY="#7aa2f7"
        SECONDARY="#bb9af7"
        ACCENT="#9ece6a"
        ;;
    "🌙 Tokyo Night")
        BG="#1a1b26"
        BG_ALT="#16161e"
        FG="#a9b1d6"
        PRIMARY="#7aa2f7"
        SECONDARY="#bb9af7"
        ACCENT="#73daca"
        ;;
    "🔥 Dracula")
        BG="#282a36"
        BG_ALT="#44475a"
        FG="#f8f8f2"
        PRIMARY="#bd93f9"
        SECONDARY="#ff79c6"
        ACCENT="#50fa7b"
        ;;
    "🌿 Nord")
        BG="#2e3440"
        BG_ALT="#3b4252"
        FG="#eceff4"
        PRIMARY="#88c0d0"
        SECONDARY="#81a1c1"
        ACCENT="#a3be8c"
        ;;
    "🌊 Catppuccin")
        BG="#1e1e2e"
        BG_ALT="#313244"
        FG="#cdd6f4"
        PRIMARY="#89b4fa"
        SECONDARY="#cba6f7"
        ACCENT="#a6e3a1"
        ;;
    "🎨 Gruvbox")
        BG="#282828"
        BG_ALT="#3c3836"
        FG="#ebdbb2"
        PRIMARY="#83a598"
        SECONDARY="#d3869b"
        ACCENT="#b8bb26"
        ;;
    *)
        exit 0
        ;;
esac

# Update BSPWM border colors
bspc config normal_border_color "$BG"
bspc config active_border_color "$SECONDARY"
bspc config focused_border_color "$PRIMARY"

# Update polybar config
sed -i "s/^background = .*/background = $BG/" ~/.config/polybar/config.ini
sed -i "s/^background-alt = .*/background-alt = $BG_ALT/" ~/.config/polybar/config.ini
sed -i "s/^foreground = .*/foreground = $FG/" ~/.config/polybar/config.ini
sed -i "s/^primary = .*/primary = $PRIMARY/" ~/.config/polybar/config.ini
sed -i "s/^secondary = .*/secondary = $SECONDARY/" ~/.config/polybar/config.ini

# Update kitty colors
sed -i "s/^background .*/background $BG/" ~/.config/kitty/kitty.conf
sed -i "s/^foreground .*/foreground $FG/" ~/.config/kitty/kitty.conf

# Reload polybar
~/.config/polybar/launch.sh &

# Reload kitty (if running)
pkill -USR1 kitty 2>/dev/null

notify-send "Theme Changed" "Applied: $selected"
