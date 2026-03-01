#!/usr/bin/env bash

BATTERY_DEVICE=$(upower -e | grep BAT)
KBD_DEVICE=$(brightnessctl --list | grep 'kbd_backlight' | awk -F"'" '{print $2}')
PIDFILE="/tmp/power-saver.pid"
current_state=""

# Ensure Hyprland is running
if [ -z "$HYPRLAND_INSTANCE_SIGNATURE" ]; then
    echo "Hyprland is not running. Exiting."
    exit 1
fi

# Ensure upower is working
if [ -z "$BATTERY_DEVICE" ]; then
    echo "Battery device not found. Is upower enabled?"
    exit 1
fi

# Prevent duplicate instances
if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
    echo "Power saver is already running (PID $(cat "$PIDFILE")). Exiting."
    exit 1
fi

# Get all connected monitor names
MONITORS=$(hyprctl monitors | awk '/Monitor/ {print $2}')

# Write PID and clean up on exit
echo $$ > "$PIDFILE"
trap 'rm -f "$PIDFILE"' EXIT

# Then replace the single hyprctl monitor keyword calls with a loop:
if [ "$new_state" = "discharging" ]; then
    echo "Switched to battery — applying power saving settings."
    brightnessctl --device="$KBD_DEVICE" set 0
    brightnessctl set 40%
    while IFS= read -r MONITOR; do
        hyprctl keyword monitor "$MONITOR",preferred,auto,1.0,bitdepth,8
    done <<< "$MONITORS"
    hyprctl keyword decoration:blur:enabled 0
    hyprctl keyword decoration:shadow:enabled 0
else
    echo "Switched to AC — restoring normal settings."
    brightnessctl --device="$KBD_DEVICE" set 100%
    brightnessctl set 50%
    while IFS= read -r MONITOR; do
        hyprctl keyword monitor "$MONITOR",preferred,auto,1.0
    done <<< "$MONITORS"
    hyprctl keyword decoration:blur:enabled 1
    hyprctl keyword decoration:shadow:enabled 1
fi
