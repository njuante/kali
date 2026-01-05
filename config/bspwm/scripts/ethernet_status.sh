#!/bin/sh
IP=$(/usr/sbin/ifconfig eth0 2>/dev/null | grep "inet " | awk '{print $2}')
if [ -n "$IP" ]; then
    echo "%{F#2495e7}ETH%{F#ffffff} $IP"
else
    echo "%{F#919191}ETH --"
fi
