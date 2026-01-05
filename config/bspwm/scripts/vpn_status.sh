#!/bin/sh

IFACE=$(/usr/sbin/ifconfig 2>/dev/null | grep tun0 | awk '{print $1}' | tr -d ':')

if [ "$IFACE" = "tun0" ]; then
    IP=$(/usr/sbin/ifconfig tun0 | grep "inet " | awk '{print $2}')
    echo "%{F#1bbf3e}VPN%{F#ffffff} $IP"
else
    echo "%{F#1bbf3e}VPN%{F#ffffff} Disconnected"
fi
