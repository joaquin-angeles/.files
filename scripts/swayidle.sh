#!/usr/bin/env bash

swayidle -w \
    timeout 270 'notify-send -u normal -a "System" "Taking a break?" "I'\''ll lock the screen for you in 30 seconds."' \
        resume 'pkill -u $USER notify-send' \
    timeout 300 'pidof hyprlock || hyprlock' \
    timeout 330 'niri msg action power-off-monitors' \
        resume 'niri msg action power-on-monitors' \
    timeout 570 'notify-send -u critical -a "System" "Still there?" "The system is about to sleep. Move the mouse to stay awake!"' \
        resume 'pkill -u $USER notify-send' \
    timeout 600 'systemctl suspend' \
        resume 'notify-send -a "System" "Welcome back!" "Pick up right where you left off."' \
    before-sleep 'pidof hyprlock || hyprlock'
