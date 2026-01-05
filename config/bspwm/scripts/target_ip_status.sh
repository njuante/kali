#!/bin/bash
ip_address=$(/bin/cat ~/.config/bspwm/scripts/target_ip 2>/dev/null | awk '{print $1}')

if [ -n "$ip_address" ]; then
    echo "%{F#e51d0b}TGT%{F#ffffff} $ip_address"
else
    echo "%{F#e51d0b}TGT%{F#ffffff} No target"
fi
