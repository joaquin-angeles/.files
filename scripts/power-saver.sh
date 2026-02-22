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

# Get the connected monitor name
MONITOR=$(hyprctl monitors | awk '/Monitor/ {print $2}' | head -n 1)

# Write PID and clean up on exit
echo $$ > "$PIDFILE"
trap 'rm -f "$PIDFILE"' EXIT

# Start monitoring battery state
upower --monitor | grep --line-buffered "$BATTERY_DEVICE" | while read -r _; do
    new_state=$(upower -i "$BATTERY_DEVICE" | grep -m1 "state:" | awk '{print $2}')

    if [ "$new_state" != "$current_state" ]; then
        current_state="$new_state"

        if [ "$new_state" = "discharging" ]; then
            echo "Switched to battery — applying power saving settings."
            brightnessctl --device="$KBD_DEVICE" set 0
            brightnessctl set 40%
            hyprctl keyword monitor "$MONITOR",1920x1080@60,auto,1.0
            hyprctl keyword decoration:blur:enabled 0
            hyprctl keyword decoration:shadow:enabled 0
        else
            echo "Switched to AC — restoring normal settings."
            brightnessctl --device="$KBD_DEVICE" set 100%
            brightnessctl set 50%
            hyprctl keyword monitor "$MONITOR",1920x1080@120,auto,1.0
            hyprctl keyword decoration:blur:enabled 1
            hyprctl keyword decoration:shadow:enabled 1
        fi
    fi
done
