#!/usr/bin/env dash

# Modifier key
mod="Super"

# App shortcuts
browser='sh -c "zen || flatpak run app.zen_browser.zen"'
filemanager='foot -e yazi'
menu='rofi -show drun'
term='footclient'
riverctl map normal "$mod" Return spawn "$term"
riverctl map normal "$mod" Space spawn "$menu"
riverctl map normal "$mod" B spawn "$browser"
riverctl map normal "$mod" E spawn "$filemanager"
riverctl map normal "$mod+Shift" E spawn 'thunar'
riverctl map normal "$mod" Period spawn 'rofi -show emoji'
riverctl map normal "$mod+Shift" V spawn 'sh -c "cliphist list | rofi -dmenu -p clipboard | cliphist decode | wl-copy"'

# Screenshots
riverctl map normal "$mod" S spawn 'grim - | wl-copy && notify-send "Screenshot saved" "Image copied to clipboard"'
riverctl map normal "$mod+Shift" S spawn 'wayfreeze --hide-cursor --after-freeze-cmd '\''grim -g "$(slurp)" - | wl-copy && notify-send "Screenshot" "Copied to clipboard"'\'''

# Toggles
riverctl map normal "$mod" W spawn 'sh -c "pgrep waybar >/dev/null && pkill waybar || waybar &"'
riverctl map normal "$mod" D spawn 'sh -c "if makoctl mode | grep -q do-not-disturb; then makoctl mode -r do-not-disturb && notify-send \"DND Off\" \"Notifications enabled\"; else notify-send \"DND On\" \"Notifications silenced\" && makoctl mode -a do-not-disturb; fi"'
riverctl map normal Control+Alt B spawn 'sh -c "pgrep sunsetr >/dev/null && pkill sunsetr || sunsetr test 4000 100"'

# Misc
riverctl map normal "$mod+Shift" X spawn 'power-menu.sh'
riverctl map normal "$mod" F1 spawn 'sh -c "cheatsheet.sh | rofi -dmenu -p keybinds"'

# Volume & brightness (Super+Fn)
riverctl map normal "$mod" F9 spawn 'osd.sh brightness_down'
riverctl map normal "$mod" F10 spawn 'osd.sh brightness_up'
riverctl map normal "$mod" F11 spawn 'osd.sh volume_down'
riverctl map normal "$mod" F12 spawn 'osd.sh volume_up'
riverctl map normal "$mod+Shift" F12 spawn 'osd.sh volume_mute'

# Media keys
riverctl map normal None XF86AudioLowerVolume spawn 'osd.sh volume_down'
riverctl map normal None XF86AudioRaiseVolume spawn 'osd.sh volume_up'
riverctl map normal None XF86AudioMute spawn 'osd.sh volume_mute'

# Brightness keys
riverctl map normal None XF86MonBrightnessUp spawn 'osd.sh brightness_up'
riverctl map normal None XF86MonBrightnessDown spawn 'osd.sh brightness_down'

# Window management
riverctl map normal "$mod" Q close
riverctl map normal "$mod" F toggle-fullscreen
riverctl map normal "$mod+Shift" F toggle-float

# Focus (hjkl)
riverctl map normal "$mod" H focus-view left
riverctl map normal "$mod" J focus-view down
riverctl map normal "$mod" K focus-view up
riverctl map normal "$mod" L focus-view right

# Swap (Shift+hjkl)
riverctl map normal "$mod+Shift" H swap left
riverctl map normal "$mod+Shift" J swap down
riverctl map normal "$mod+Shift" K swap up
riverctl map normal "$mod+Shift" L swap right

# Resize (Alt+hjkl)
riverctl map normal "$mod+Alt" H send-layout-cmd wideriver '--ratio -0.05'
riverctl map normal "$mod+Alt" J send-layout-cmd wideriver '--count -1'
riverctl map normal "$mod+Alt" K send-layout-cmd wideriver '--count +1'
riverctl map normal "$mod+Alt" L send-layout-cmd wideriver '--ratio +0.05'

# Tags (workspaces)
i=1
while [ "$i" -le 9 ]; do
    tags=$(( 1 << (i - 1) ))
    riverctl map normal "$mod" "$i" set-focused-tags "$tags"
    riverctl map normal "$mod+Shift" "$i" set-view-tags "$tags"
    i=$(( i + 1 ))
done
all_tags=$(( (1 << 32) - 1 ))
riverctl map normal "$mod" 0 set-focused-tags "$all_tags"
riverctl map normal "$mod+Shift" 0 set-view-tags "$all_tags"
