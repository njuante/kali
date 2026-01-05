#!/bin/bash

# Calendar Script for Polybar

DATE=$(date '+%A, %B %d, %Y')
TIME=$(date '+%H:%M:%S')

notify-send "📅 $DATE" "$TIME" -i office-calendar
