#!/usr/bin/env sh

swayidle -w \
    timeout 300  'pidof hyprlock || hyprlock' \
    timeout 330  'wlopm --off \*' \
    resume       'wlopm --on \*' \
    timeout 600  'systemctl suspend' \
    resume       'notify-send -a "System" "Welcome back!" "Pick up right where you left off."' \
    before-sleep 'pidof hyprlock || hyprlock'
