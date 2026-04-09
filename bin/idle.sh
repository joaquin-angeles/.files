#!/usr/bin/env dash

swayidle -w \
    timeout 300 'hyprlock' \
    timeout 600 'systemctl suspend' \
    before-sleep 'hyprlock'
