#!/bin/bash

# Volume Notification Script

VOLUME=$(pamixer --get-volume)
MUTED=$(pamixer --get-mute)

if [ "$MUTED" = "true" ]; then
    notify-send -h string:x-canonical-private-synchronous:volume \
        -h int:value:0 \
        -i audio-volume-muted \
        "Volume" "Muted"
else
    if [ "$VOLUME" -le 33 ]; then
        ICON="audio-volume-low"
    elif [ "$VOLUME" -le 66 ]; then
        ICON="audio-volume-medium"
    else
        ICON="audio-volume-high"
    fi
    
    notify-send -h string:x-canonical-private-synchronous:volume \
        -h int:value:$VOLUME \
        -i $ICON \
        "Volume" "$VOLUME%"
fi
