#!/bin/bash

# VPN Toggle Script

VPN_STATUS=$(ip a | grep -E "tun0|tap0" | grep -c "inet ")

if [ "$VPN_STATUS" -ge 1 ]; then
    # VPN is connected - show info
    VPN_IP=$(ip a show tun0 2>/dev/null | grep "inet " | awk '{print $2}' | cut -d'/' -f1)
    if [ -z "$VPN_IP" ]; then
        VPN_IP=$(ip a show tap0 2>/dev/null | grep "inet " | awk '{print $2}' | cut -d'/' -f1)
    fi
    notify-send "VPN Status" "Connected: $VPN_IP"
else
    # VPN is disconnected - prompt to connect
    notify-send "VPN Status" "Disconnected\nUse openvpn to connect"
fi
