#!/usr/bin/env dash

# Input options
riverctl keyboard-layout -options 'caps:escape' ''
riverctl set-cursor-warp on-focus-change
riverctl focus-follows-cursor normal
riverctl hide-cursor timeout 5000
riverctl hide-cursor when-typing enabled

exec river-input # USB auto-set daemon
