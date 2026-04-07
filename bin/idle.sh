#!/usr/bin/env dash

swayidle -w \
timeout 300  'pgrep -x hyprlock >/dev/null || hyprlock' \
timeout 600  'wlopm --off "*"' \
resume       'wlopm --on "*" && notify-send -a "System" "Welcome back!" "Pick up right where you left off."' \
timeout 900  'systemctl suspend' \
resume       'wlopm --on "*"' \
before-sleep 'pgrep -x hyprlock >/dev/null || hyprlock'
