#!/usr/bin/env dash

# Portal fixes
export XDG_CURRENT_DESKTOP=river
dbus-update-activation-environment --systemd --all

# Window behavior
riverctl rule-add ssd # Global window decorations
riverctl default-layout wideriver # Layout generator

# Window layout generator
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
    --border-width-smart-gaps 0
