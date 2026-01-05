#!/bin/bash

#####################################################
#              Scratchpad Terminal                  #
#####################################################

# Scratchpad window class
SCRATCHPAD_CLASS="scratchpad"

# Check if scratchpad exists
if xdotool search --class "$SCRATCHPAD_CLASS" > /dev/null 2>&1; then
    # Toggle visibility
    WINDOW_ID=$(xdotool search --class "$SCRATCHPAD_CLASS" | head -1)
    
    if [ "$(xdotool getactivewindow)" = "$WINDOW_ID" ]; then
        # Hide scratchpad
        xdotool windowunmap "$WINDOW_ID"
    else
        # Show and focus scratchpad
        xdotool windowmap "$WINDOW_ID"
        xdotool windowactivate "$WINDOW_ID"
        bspc node "$WINDOW_ID" -t floating
        bspc node "$WINDOW_ID" -g sticky=on
    fi
else
    # Create new scratchpad
    kitty --class "$SCRATCHPAD_CLASS" &
    sleep 0.3
    
    WINDOW_ID=$(xdotool search --class "$SCRATCHPAD_CLASS" | head -1)
    
    # Configure as floating and sticky
    bspc node "$WINDOW_ID" -t floating
    bspc node "$WINDOW_ID" -g sticky=on
    
    # Center and resize (for 1920x1080)
    xdotool windowsize "$WINDOW_ID" 800 500
    xdotool windowmove "$WINDOW_ID" 560 290
fi
