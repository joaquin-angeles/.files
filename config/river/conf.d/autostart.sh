#!/usr/bin/env dash

riverctl spawn "wbg ~/Pictures/Wallpapers/trees.png"
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

exec wideriver \
    --border-width 2 \
    --border-color-focused 0x879251cc \
    --border-color-unfocused 0x56595acc \
    --layout left \
    --layout-alt monocle \
    --stack even \
    --count-master 1 \
    --ratio-master 0.55 \
    --inner-gaps 12 \
    --outer-gaps 12 \
    --smart-gaps \
    --border-width-smart-gaps 0 \
    --log-threshold info \
    >> /tmp/wideriver.log 2>&1
