#!/usr/bin/env bash

# Freeze the screen
wayfreeze &
sleep 0.1

# Take screenshot of selected area
grim -g "$(slurp)" - | wl-copy

# Unfreeze and notify
pkill wayfreeze
notify-send "Screenshot saved" "Image copied to clipboard"
