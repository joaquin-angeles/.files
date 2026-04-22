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
    --inner-gaps 10 \
    --outer-gaps 10 \
    --smart-gaps \
    --border-width-smart-gaps 0'
