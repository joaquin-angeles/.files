#!/usr/bin/env dash

swayidle -w \
    timeout 300  'pgrep -x swaylock >/dev/null || swaylock' \
    timeout 600  'wlopm --off "*"' \
    resume       'wlopm --on "*"' \
    timeout 900  'systemctl suspend' \
    resume       'notify-send -a "System" "Welcome back!" "Pick up right where you left off."' \
    before-sleep 'pgrep -x swaylock >/dev/null || swaylock'
