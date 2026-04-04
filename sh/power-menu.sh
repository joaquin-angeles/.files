#!/usr/bin/env sh

options="󰐥 Shutdown
󰜉 Reboot
󰌾 Lock
󰒲 Suspend
󰍃 Logout"

choice="$(printf '%s\n' "$options" | rofi -dmenu -p 'power')"

case "$choice" in
    "󰐥 Shutdown")
        systemctl poweroff
        ;;
    "󰜉 Reboot")
        systemctl reboot
        ;;
    "󰌾 Lock")
        if command -v gtklock >/dev/null 2>&1; then
            gtklock
        elif command -v hyprlock >/dev/null 2>&1; then
            hyprlock
        elif command -v i3lock >/dev/null 2>&1; then
            i3lock
        elif command -v betterlockscreen >/dev/null 2>&1; then
            betterlockscreen -l
        else
            notify-send "No lock utility found."
        fi
        ;;
    "󰒲 Suspend")
        systemctl suspend
        ;;
    "󰍃 Logout")
        if command -v riverctl >/dev/null 2>&1; then
            riverctl exit && pkill -u "$USER"
        else
            pkill -u "$USER"
        fi
        ;;
esac
