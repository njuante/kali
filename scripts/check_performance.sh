#!/bin/bash

#####################################################
#        SCRIPT DE DIAGNÓSTICO DE RENDIMIENTO       #
#             Para BSPWM en Kali Linux              #
#####################################################

echo "═══════════════════════════════════════════════════"
echo "       DIAGNÓSTICO DE RENDIMIENTO BSPWM"
echo "═══════════════════════════════════════════════════"
echo ""

# Detectar si es una VM
echo "▶ Detectando entorno..."
if systemd-detect-virt -q 2>/dev/null; then
    VM_TYPE=$(systemd-detect-virt)
    echo "  ⚠️  EJECUTANDO EN MÁQUINA VIRTUAL: $VM_TYPE"
    echo "  💡 Recomendación: Usa configuración ligera"
else
    echo "  ✓ No se detectó virtualización"
fi
echo ""

# Memoria RAM
echo "▶ Memoria RAM:"
free -h | grep -E "Mem:|Swap:"
echo ""

# CPU
echo "▶ Información CPU:"
grep "model name" /proc/cpuinfo | head -1
grep "cpu cores" /proc/cpuinfo | head -1
echo ""

# GPU/Driver
echo "▶ Driver de video:"
if command -v glxinfo &> /dev/null; then
    glxinfo | grep -E "OpenGL renderer|OpenGL version" 2>/dev/null || echo "  No disponible"
else
    echo "  glxinfo no instalado (instala mesa-utils)"
fi
echo ""

# Procesos que más CPU consumen
echo "▶ Top 5 procesos por CPU:"
ps aux --sort=-%cpu | head -6
echo ""

# Estado de picom
echo "▶ Estado de Picom:"
if pgrep -x picom > /dev/null; then
    echo "  ✓ Picom está corriendo"
    PICOM_PID=$(pgrep -x picom)
    echo "  PID: $PICOM_PID"
    echo "  CPU: $(ps -p $PICOM_PID -o %cpu --no-headers)%"
else
    echo "  ✗ Picom NO está corriendo"
fi
echo ""

# Estado de polybar
echo "▶ Estado de Polybar:"
if pgrep -x polybar > /dev/null; then
    echo "  ✓ Polybar está corriendo"
else
    echo "  ✗ Polybar NO está corriendo"
fi
echo ""

# Recomendaciones
echo "═══════════════════════════════════════════════════"
echo "              RECOMENDACIONES"
echo "═══════════════════════════════════════════════════"
echo ""
echo "Si sigue lento, prueba estos comandos:"
echo ""
echo "1. DESHABILITAR PICOM (quita bordes redondeados pero más rápido):"
echo "   killall picom"
echo ""
echo "2. REINICIAR BSPWM:"
echo "   bspc wm -r"
echo ""
echo "3. VERIFICAR USO DE RECURSOS:"
echo "   htop"
echo ""
echo "4. SI USAS VIRTUALBOX - Aumentar:"
echo "   - Memoria de video a 128MB"
echo "   - Habilitar aceleración 3D"
echo "   - RAM mínima 2GB (recomendado 4GB)"
echo ""
echo "5. SI USAS VMWARE:"
echo "   - Habilitar aceleración 3D"
echo "   - RAM mínima 2GB"
echo ""
