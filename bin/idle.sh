#!/usr/bin/env dash

lock_cmd='pgrep -x hyprlock >/dev/null || hyprlock'

swayidle -w \
    timeout 300 "$lock_cmd" \
    timeout 600 'wlopm --off "*"' \
    timeout 900 'systemctl suspend' \
    resume 'wlopm --on "*"; pkill -SIGUSR1 swayidle' \
    before-sleep "$lock_cmd"
