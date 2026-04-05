#!/usr/bin/env dash

# Output & layout
riverctl rule-add ssd
riverctl default-layout wideriver
riverctl spawn 'wideriver \
--border-width 2 \
--border-color-focused 0x5e8279cc \
--border-color-unfocused 0x56595acc \
--layout left \
--stack even \
--count-master 1 \
--ratio-master 0.55 \
--inner-gaps 10 \
--outer-gaps 10 \
--smart-gaps \
--border-width-smart-gaps 0 \
> ~/.wideriver.log 2>&1 &'
