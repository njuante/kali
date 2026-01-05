#!/bin/bash

#####################################################
#           Low Battery Notifier                    #
#####################################################

while true; do
    BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null || echo "100")
    BATTERY_STATUS=$(cat /sys/class/power_supply/BAT0/status 2>/dev/null || echo "Unknown")
    
    if [ "$BATTERY_STATUS" = "Discharging" ]; then
        if [ "$BATTERY_LEVEL" -le 10 ]; then
            notify-send -u critical "󰂃 Battery Critical!" "Battery at ${BATTERY_LEVEL}%\nPlug in your charger!"
        elif [ "$BATTERY_LEVEL" -le 20 ]; then
            notify-send -u normal "󰁻 Low Battery" "Battery at ${BATTERY_LEVEL}%"
        fi
    fi
    
    sleep 120  # Check every 2 minutes
done
