#!/usr/bin/env dash

mod="Super"
alias bind="riverctl map normal"
alias bindm="riverctl map-pointer normal"

# Tag management
for i in $(seq 1 9); do
    tags=$((1 << (i - 1)))
    bind $mod "$i" set-focused-tags $tags
    bind $mod+Shift "$i" set-view-tags $tags
    bind $mod+Control "$i" toggle-focused-tags $tags
done

# View/set windows for all tags
all_tags=$(( (1 << 32) - 1 ))
bind $mod 0 set-focused-tags "$all_tags"
bind $mod+Shift 0 spawn 'river-sticky'

# Layout switching
bind $mod space send-layout-cmd wideriver "--layout-toggle"
bind $mod t send-layout-cmd wideriver '--layout left'
bind $mod m send-layout-cmd wideriver '--layout monocle'

# Window management
bind $mod+Shift c close
bind $mod f toggle-fullscreen
bind $mod+Shift space toggle-float
bind $mod+Shift return zoom

# Focus (jk)
bind $mod j focus-view next
bind $mod k focus-view previous

# Resize (hl)
bind $mod h send-layout-cmd wideriver '--ratio -0.05'
bind $mod l send-layout-cmd wideriver '--ratio +0.05'
bind $mod i send-layout-cmd wideriver '--count +1'
bind $mod d send-layout-cmd wideriver '--count -1'
bindm $mod BTN_RIGHT resize-view

# Swap (Shift+hjkl)
bind $mod+Shift j swap next
bind $mod+Shift k swap previous
bindm $mod BTN_LEFT move-view

# Apps
bind $mod return spawn 'foot'
bind $mod p spawn 'rofi -show drun'
bind $mod w spawn 'librewolf'
bind $mod e spawn 'pcmanfm'
bind $mod period spawn 'rofi -no-show-icons -show emoji'
bind $mod v spawn 'cliphist list | rofi -dmenu -no-show-icons -p 󱘞 | cliphist decode | wl-copy'

# App toggles
bind $mod b spawn 'pgrep waybar >/dev/null && pkill waybar || waybar'
bind $mod+Shift n spawn 'pgrep gammastep >/dev/null && pkill gammastep || gammastep -O 4000'

# Screenshots
bind $mod s spawn 'grimshot --region'
bind $mod+Shift s spawn 'grimshot --output'

# Misc
bind $mod+Shift q spawn 'rofi-power-menu'
bind $mod f1 spawn 'river-sheet'

# Volume & brightness
bind $mod minus spawn 'mako-osd --volume-down 5'
bind $mod equal spawn 'mako-osd --volume-up 5'
bind $mod bracketleft spawn 'mako-osd --brightness-down 5'
bind $mod bracketright spawn 'mako-osd --brightness-up 5'
bind $mod+Shift m spawn 'mako-osd --volume-mute'

# Media keys
bind None XF86AudioLowerVolume spawn 'mako-osd --volume-down 5'
bind None XF86AudioRaiseVolume spawn 'mako-osd --volume-up 5'
bind None XF86AudioMute spawn 'mako-osd --volume-mute'
bind None XF86MonBrightnessUp   spawn 'mako-osd --brightness-up 5'
bind None XF86MonBrightnessDown spawn 'mako-osd --brightness-down 5'
