#!/bin/bash

# Network Traffic Script for Polybar

INTERFACE=$(ip route | grep default | awk '{print $5}' | head -1)

if [ -z "$INTERFACE" ]; then
    echo "󰈂 N/A"
    exit 0
fi

# Get current bytes
RX1=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
TX1=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)

sleep 1

RX2=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
TX2=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)

# Calculate speed
RX_SPEED=$((($RX2 - $RX1) / 1024))
TX_SPEED=$((($TX2 - $TX1) / 1024))

# Format output
format_speed() {
    if [ $1 -ge 1024 ]; then
        echo "$(($1 / 1024)) M"
    else
        echo "$1 K"
    fi
}

echo "󰁅 $(format_speed $RX_SPEED) 󰁝 $(format_speed $TX_SPEED)"
