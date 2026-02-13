#!/usr/bin/env bash

set -euo pipefail

# Configuration
readonly BATTERY_DEVICE=$(upower -e | grep BAT | head -n 1)
readonly KBD_DEVICE=$(brightnessctl --list | grep 'kbd_backlight' | awk -F"'" '{print $2}')
readonly MONITOR=$(hyprctl monitors 2>/dev/null | awk '/Monitor/ {print $2}' | head -n 1)

current_state=""

# Validation functions
check_hyprland() {
    if [ -z "${HYPRLAND_INSTANCE_SIGNATURE:-}" ]; then
        echo "Error: Hyprland is not running." >&2
        exit 1
    fi
}

check_battery() {
    if [ -z "$BATTERY_DEVICE" ]; then
        echo "Error: Battery device not found. Is upower enabled?" >&2
        exit 1
    fi
}

check_keyboard_backlight() {
    if [ -z "$KBD_DEVICE" ]; then
        echo "Warning: Keyboard backlight device not found. Skipping kbd control." >&2
        return 1
    fi
    return 0
}

check_monitor() {
    if [ -z "$MONITOR" ]; then
        echo "Warning: Could not detect monitor. Skipping refresh rate changes." >&2
        return 1
    fi
    return 0
}

# Apply settings based on battery state
apply_power_settings() {
    local state=$1
    local has_kbd=$2
    local has_monitor=$3

    if [ "$state" = "discharging" ]; then
        echo "Switching to battery mode..."
        [ "$has_kbd" -eq 0 ] && brightnessctl --device="$KBD_DEVICE" set 0
        [ "$has_monitor" -eq 0 ] && hyprctl keyword monitor "$MONITOR,1920x1080@60,auto,1.0"
    else
        echo "Switching to AC mode..."
        [ "$has_kbd" -eq 0 ] && brightnessctl --device="$KBD_DEVICE" set 100%
        [ "$has_monitor" -eq 0 ] && hyprctl keyword monitor "$MONITOR,1920x1080@120,auto,1.0"
    fi
}

# Cleanup handler
cleanup() {
    echo "Shutting down battery monitor..."
    exit 0
}

trap cleanup SIGINT SIGTERM

# Main
main() {
    check_hyprland
    check_battery
    
    # Check optional features once
    check_keyboard_backlight && local has_kbd=0 || local has_kbd=1
    check_monitor && local has_monitor=0 || local has_monitor=1

    echo "Starting battery state monitor..."
    echo "Battery: $BATTERY_DEVICE"
    [ "$has_kbd" -eq 0 ] && echo "Keyboard: $KBD_DEVICE"
    [ "$has_monitor" -eq 0 ] && echo "Monitor: $MONITOR"

    # Monitor battery state changes
    upower --monitor | grep --line-buffered "$BATTERY_DEVICE" | while read -r _; do
        new_state=$(upower -i "$BATTERY_DEVICE" | grep -m1 "state:" | awk '{print $2}')
        
        if [ "$new_state" != "$current_state" ]; then
            current_state="$new_state"
            apply_power_settings "$new_state" "$has_kbd" "$has_monitor"
        fi
    done
}

main
