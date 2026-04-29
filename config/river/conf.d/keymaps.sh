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

# Layout switching
riverctl map normal $mod space send-layout-cmd wideriver "--layout-toggle"
riverctl map normal $mod t send-layout-cmd wideriver '--layout left'
riverctl map normal $mod m send-layout-cmd wideriver '--layout monocle'

# Window management
riverctl map normal $mod+Shift c close
riverctl map normal $mod f toggle-fullscreen
riverctl map normal $mod+Shift space toggle-float
riverctl map normal $mod+Shift return zoom

# Focus (jk)
riverctl map normal $mod j focus-view next
riverctl map normal $mod k focus-view previous

# Resize (hl)
riverctl map normal $mod h send-layout-cmd wideriver '--ratio -0.05'
riverctl map normal $mod l send-layout-cmd wideriver '--ratio +0.05'
riverctl map normal $mod i send-layout-cmd wideriver '--count +1'
riverctl map normal $mod d send-layout-cmd wideriver '--count -1'
riverctl map-pointer normal $mod BTN_RIGHT resize-view

# Swap (Shift+hjkl)
riverctl map normal $mod+Shift j swap next
riverctl map normal $mod+Shift j swap previous
riverctl map-pointer normal $mod BTN_LEFT move-view

# Apps
riverctl map normal $mod return spawn 'foot'
riverctl map normal $mod p spawn 'rofi -show drun'
riverctl map normal $mod w spawn 'librewolf'
riverctl map normal $mod e spawn 'pcmanfm'
riverctl map normal $mod period spawn 'rofi -no-show-icons -show emoji'
riverctl map normal $mod v spawn 'cliphist list | rofi -dmenu -no-show-icons -p 󱘞 | cliphist decode | wl-copy'

# App toggles
riverctl map normal $mod b spawn 'pgrep waybar >/dev/null && pkill waybar || waybar'
riverctl map normal $mod+Shift n spawn 'pgrep gammastep >/dev/null && pkill gammastep || gammastep -O 4000'

# Screenshots
riverctl map normal $mod s spawn 'grimshot --region'
riverctl map normal $mod+Shift s spawn 'grimshot --output'

# Misc
riverctl map normal $mod+Shift q spawn 'rofi-power-menu'
riverctl map normal $mod f1 spawn 'river-sheet'

# Volume & brightness
riverctl map normal $mod minus spawn 'mako-osd --volume-down 5'
riverctl map normal $mod equal spawn 'mako-osd --volume-up 5'
riverctl map normal $mod bracketleft spawn 'mako-osd --brightness-down 5'
riverctl map normal $mod bracketright spawn 'mako-osd --brightness-up 5'
riverctl map normal $mod+Shift m spawn 'mako-osd --volume-mute'

# Media keys
riverctl map normal None XF86AudioLowerVolume spawn 'mako-osd --volume-down 5'
riverctl map normal None XF86AudioRaiseVolume spawn 'mako-osd --volume-up 5'
riverctl map normal None XF86AudioMute spawn 'mako-osd --volume-mute'
riverctl map normal None XF86MonBrightnessUp   spawn 'mako-osd --brightness-up 5'
riverctl map normal None XF86MonBrightnessDown spawn 'mako-osd --brightness-down 5'
