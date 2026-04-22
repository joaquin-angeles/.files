#!/usr/bin/env dash

riverctl rule-add ssd
riverctl default-layout wideriver
riverctl spawn 'wideriver \
    --border-width 2 \
    --border-color-focused 0x879251cc \
    --border-color-unfocused 0x56595acc \
    --layout left \
    --stack even \
    --ratio-master 0.55 \
    --inner-gaps 12 \
    --outer-gaps 12 \
    --smart-gaps \
    --border-width-smart-gaps 0'
