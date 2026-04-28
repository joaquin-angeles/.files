#!/usr/bin/env dash

riverctl keyboard-layout -options 'caps:escape' ''
riverctl set-cursor-warp on-focus-change
riverctl focus-follows-cursor normal
riverctl hide-cursor timeout 5000
riverctl hide-cursor when-typing enabled
riverctl spawn 'river-input'
