#!/usr/bin/env dash

riverctl spawn "wbg ~/Pictures/Wallpapers/trees.png"
riverctl spawn 'wlpower'
riverctl spawn 'mako'

# Clipboard history daemon
riverctl spawn 'nohup wl-paste --type text --watch cliphist store >/dev/null 2>&1'
riverctl spawn 'nohup wl-paste --type image --watch cliphist store >/dev/null 2>&1'

# Idling system
riverctl spawn 'swayidle -w \
    timeout 300 "gtklock --daemonize" \
    timeout 600 "wlopm --off \"*\"" \
    resume "wlopm --on \"*\"" \
    timeout 900 "systemctl suspend" \
    before-sleep "gtklock --daemonize" \
    after-resume "wlopm --on \"*\""'
