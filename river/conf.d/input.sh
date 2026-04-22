#!/usr/bin/env dash

riverctl keyboard-layout -options 'caps:escape' ''
riverctl xcursor-theme Bibata-Modern-Ice 24
riverctl set-cursor-warp on-focus-change
riverctl focus-follows-cursor normal
riverctl hide-cursor timeout 5000
riverctl hide-cursor when-typing enabled
riverctl spawn 'river-input'
