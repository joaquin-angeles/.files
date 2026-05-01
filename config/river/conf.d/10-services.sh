#!/usr/bin/env dash

# Autostart daemons
waybar & # Status bar
wlpower & # Refresh rate switching on battery states
wbg ~/Pictures/Wallpapers/trees.png & # Wallpaper daemon
mako & # Notification daemon

# Clipboard history daemon
rm -f "$XDG_CACHE_HOME"/cliphist/db # Reset clipboard history on boot
wl-paste --type text --watch cliphist store >/dev/null 2>&1 &
wl-paste --type image --watch cliphist store >/dev/null 2>&1 &

# System state monitor
swayidle -w \
    lock 'gtklock' \
    timeout 300 'gtklock --daemonize' \
    timeout 600 'wlopm --off "*"' \
    resume 'wlopm --on "*"' \
    timeout 900 'systemctl suspend' \
    before-sleep 'gtklock --daemonize' \
    after-resume 'wlopm --on "*"' &

foot -s & # Terminal daemon
