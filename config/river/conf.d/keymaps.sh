#!/usr/bin/env dash

mod="Super"

# Window management
riverctl map normal "$mod+Shift" C close
riverctl map normal "$mod" F toggle-fullscreen
riverctl map normal "$mod+Shift" Space toggle-float
riverctl map normal "$mod+Shift" Return zoom

# Layout switching
riverctl map normal "$mod" Space send-layout-cmd wideriver "--layout-toggle"
riverctl map normal "$mod" T send-layout-cmd wideriver '--layout left'
riverctl map normal "$mod" M send-layout-cmd wideriver '--layout monocle'

# Focus (jk)
riverctl map normal "$mod" J focus-view next
riverctl map normal "$mod" K focus-view previous

# Resize (hl)
riverctl map normal "$mod" H send-layout-cmd wideriver '--ratio -0.05'
riverctl map normal "$mod" L send-layout-cmd wideriver '--ratio +0.05'
riverctl map normal "$mod" I send-layout-cmd wideriver '--count +1'
riverctl map normal "$mod" D send-layout-cmd wideriver '--count -1'
riverctl map-pointer normal "$mod" BTN_RIGHT resize-view

# Swap (Shift+hjkl)
riverctl map normal "$mod+Shift" J swap next
riverctl map normal "$mod+Shift" K swap previous
riverctl map-pointer normal "$mod" BTN_LEFT move-view

# Apps
riverctl map normal "$mod" Return spawn 'foot'
riverctl map normal "$mod" P spawn 'tofi-drun'
riverctl map normal "$mod" W spawn 'librewolf'
riverctl map normal "$mod" E spawn 'pcmanfm'
riverctl map normal "$mod" Period spawn 'rofi -show emoji'
riverctl map normal "$mod" V spawn 'sh -c "cliphist list | rofi -dmenu -p clipboard | cliphist decode | wl-copy"'

# App toggles
riverctl map normal "$mod" B spawn 'sh -c "pgrep waybar >/dev/null && pkill waybar || waybar"'
riverctl map normal "$mod+Shift" N spawn 'sh -c "pgrep gammastep >/dev/null && pkill gammastep || gammastep -O 4000"'

# Screenshots
riverctl map normal "$mod+Shift" S spawn 'grim - | wl-copy && notify-send "Screenshot saved" "Image copied to clipboard"'
riverctl map normal "$mod" S spawn 'region-capture.sh && notify-send "Screenshot saved" "Image copied to clipboard"'

# Misc
riverctl map normal "$mod+Shift" Q spawn 'rofi-power-menu'
riverctl map normal "$mod" F1 spawn 'sh -c "river-sheet | rofi -dmenu -p '"'"'󱊫 Keybinds'"'"'"'

# Volume & brightness
riverctl map normal "$mod" Left spawn 'mako-osd brightness_down'
riverctl map normal "$mod" Right spawn 'mako-osd brightness_up'
riverctl map normal "$mod" Down spawn 'mako-osd volume_down'
riverctl map normal "$mod" Up spawn 'mako-osd volume_up'
riverctl map normal "$mod+Shift" M spawn 'mako-osd volume_mute'

# Media keys
riverctl map normal None XF86AudioLowerVolume spawn 'mako-osd volume_down'
riverctl map normal None XF86AudioRaiseVolume spawn 'mako-osd volume_up'
riverctl map normal None XF86AudioMute spawn 'mako-osd volume_mute'
riverctl map normal None XF86MonBrightnessUp   spawn 'mako-osd brightness_up'
riverctl map normal None XF86MonBrightnessDown spawn 'mako-osd brightness_down'
