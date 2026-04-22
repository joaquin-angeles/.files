riverctl spawn 'wbg ~/Pictures/Wallpapers/trees.png'
riverctl spawn 'wlr-power'
riverctl spawn 'mako'
riverctl spawn 'cliphist.sh'

# Idling system
riverctl spawn 'swayidle -w \
    timeout 300 "gtklock --daemonize" \
    timeout 600 "wlopm --off \"*\"" \
    resume "wlopm --on \"*\"" \
    timeout 900 "systemctl suspend" \
    before-sleep "gtklock --daemonize" \
    after-resume "wlopm --on \"*\""'
