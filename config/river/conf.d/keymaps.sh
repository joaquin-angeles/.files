#!/usr/bin/env dash

mod="Super"

# Tag management
for i in $(seq 1 9); do
    tags=$((1 << (i - 1)))
    riverctl map normal $mod "$i" set-focused-tags $tags
    riverctl map normal $mod+Shift "$i" set-view-tags $tags
    riverctl map normal $mod+Control "$i" toggle-focused-tags $tags
done

# View/set windows for all tags
all_tags=$(( (1 << 32) - 1 ))
riverctl map normal $mod 0 set-focused-tags "$all_tags"
riverctl map normal $mod+Shift 0 spawn 'river-sticky'

# Window management
riverctl map normal $mod+Shift C close
riverctl map normal $mod F toggle-fullscreen
riverctl map normal $mod+Shift Space toggle-float
riverctl map normal $mod+Shift Return zoom

# Layout switching
riverctl map normal $mod Space send-layout-cmd wideriver "--layout-toggle"
riverctl map normal $mod T send-layout-cmd wideriver '--layout left'
riverctl map normal $mod M send-layout-cmd wideriver '--layout monocle'

# Focus (jk)
riverctl map normal $mod J focus-view next
riverctl map normal $mod K focus-view previous

# Resize (hl)
riverctl map normal $mod H send-layout-cmd wideriver '--ratio -0.05'
riverctl map normal $mod L send-layout-cmd wideriver '--ratio +0.05'
riverctl map normal $mod I send-layout-cmd wideriver '--count +1'
riverctl map normal $mod D send-layout-cmd wideriver '--count -1'
riverctl map-pointer normal $mod BTN_RIGHT resize-view

# Swap (Shift+hjkl)
riverctl map normal $mod+Shift J swap next
riverctl map normal $mod+Shift K swap previous
riverctl map-pointer normal $mod BTN_LEFT move-view

# Apps
riverctl map normal $mod Return spawn 'foot'
riverctl map normal $mod P spawn 'rofi -show drun'
riverctl map normal $mod W spawn 'librewolf'
riverctl map normal $mod E spawn 'pcmanfm'
riverctl map normal $mod Period spawn 'rofi -no-show-icons -show emoji'
riverctl map normal $mod V spawn 'cliphist list | rofi -dmenu -no-show-icons -p 󱘞 | cliphist decode | wl-copy'

# App toggles
riverctl map normal $mod B spawn 'pgrep waybar >/dev/null && pkill waybar || waybar'
riverctl map normal $mod+Shift N spawn 'pgrep gammastep >/dev/null && pkill gammastep || gammastep -O 4000'

# Screenshots
riverctl map normal $mod S spawn 'grimshot --region'
riverctl map normal $mod+Shift S spawn 'grimshot --output'

# Misc
riverctl map normal $mod+Shift Q spawn 'rofi-power-menu'
riverctl map normal $mod F1 spawn 'river-sheet | rofi -dmenu -p "󱊫 Keybinds"'

# Volume & brightness
riverctl map normal $mod Minus spawn 'mako-osd --volume-down 5'
riverctl map normal $mod Equal spawn 'mako-osd --volume-up 5'
riverctl map normal $mod BracketLeft spawn 'mako-osd --brightness-down 5'
riverctl map normal $mod BracketRight spawn 'mako-osd --brightness-up 5'
riverctl map normal $mod+Shift M spawn 'mako-osd --volume-mute'

# Media keys
riverctl map normal None XF86AudioLowerVolume spawn 'mako-osd --volume-down 5'
riverctl map normal None XF86AudioRaiseVolume spawn 'mako-osd --volume-up 5'
riverctl map normal None XF86AudioMute spawn 'mako-osd --volume-mute'
riverctl map normal None XF86MonBrightnessUp   spawn 'mako-osd --brightness-up 5'
riverctl map normal None XF86MonBrightnessDown spawn 'mako-osd --brightness-down 5'
