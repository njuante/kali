#!/bin/bash

#####################################################
#              Resize Mode Script                   #
#####################################################

notify-send "Resize Mode" "Use W/N/T/S/R keys, ESC to exit\nW: Wider | N: Narrower\nT: Taller | S: Shorter\nR: Reset"

while true; do
    # Read a single character
    read -rsn1 key
    
    case $key in
        w|W)
            # Wider
            bspc node -z right 20 0
            bspc node -z left -20 0
            ;;
        n|N)
            # Narrower
            bspc node -z right -20 0
            bspc node -z left 20 0
            ;;
        t|T)
            # Taller
            bspc node -z bottom 0 20
            bspc node -z top 0 -20
            ;;
        s|S)
            # Shorter
            bspc node -z bottom 0 -20
            bspc node -z top 0 20
            ;;
        r|R)
            # Reset (equalize)
            bspc node @/ -E
            ;;
        $'\e')
            # Escape - exit resize mode
            notify-send "Resize Mode" "Exited"
            break
            ;;
    esac
done
