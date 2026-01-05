#!/bin/bash

# VPN Status Script for Polybar

VPN_STATUS=$(ip a | grep -E "tun0|tap0" | grep -c "inet ")

if [ "$VPN_STATUS" -ge 1 ]; then
    VPN_IP=$(ip a show tun0 2>/dev/null | grep "inet " | awk '{print $2}' | cut -d'/' -f1)
    if [ -z "$VPN_IP" ]; then
        VPN_IP=$(ip a show tap0 2>/dev/null | grep "inet " | awk '{print $2}' | cut -d'/' -f1)
    fi
    echo "%{F#9ece6a}󰦝 Connected%{F-}"
else
    echo "%{F#f7768e}󰦞 Disconnected%{F-}"
fi
