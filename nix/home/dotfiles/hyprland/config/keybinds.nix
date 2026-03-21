{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # App shortcuts
      "$mod, RETURN, exec, $term"
      "$mod, SPACE, exec, $menu"
      "$mod, b, exec, $browser"
      "$mod, e, exec, $fileManager"
      "$mod SHIFT, e, exec, nautilus"

      # Utilities
      "CTRL ALT, B, exec, pgrep sunsetr >/dev/null && pkill sunsetr || sunsetr test 4000 100"
      "$mod, PERIOD, exec, rofi -show emoji"
      "$mod, r, exec, hyprctl reload"
      "$mod, s, exec, grim - | wl-copy && notify-send \"Screenshot saved\" \"Image copied to clipboard\""
      "$mod SHIFT, s, exec, bash -c 'wayfreeze & sleep 0.1 && grim -g \"$(slurp)\" - | wl-copy; pkill wayfreeze; notify-send \"Screenshot saved\" \"Image copied to clipboard\"'"
      "$mod, w, exec, pgrep waybar >/dev/null && pkill waybar || waybar &"
      "$mod, n, exec, bash -c 'if makoctl mode | grep -q do-not-disturb; then makoctl mode -r do-not-disturb && notify-send \"DND Off\" \"Notifications enabled\"; else notify-send \"DND On\" \"Notifications silenced\" && makoctl mode -a do-not-disturb; fi'"
      "$mod SHIFT, q, exec, power-menu.sh"
      "$mod SHIFT, p, exec, hyprpicker -a"
      "$mod, V, exec, cliphist list | rofi -dmenu -p 'clipboard' | cliphist decode | wl-copy"

      # Volume & brightness (keyboard shortcuts)
      "$mod, F9,  exec, swayosd-client --brightness lower"
      "$mod, F10, exec, swayosd-client --brightness raise"
      "$mod, F11, exec, swayosd-client --output-volume lower"
      "$mod, F12, exec, swayosd-client --output-volume raise"
      "$mod SHIFT, F12, exec, swayosd-client --output-volume mute-toggle"

      # Window & session management
      "$mod SHIFT, SPACE, exec, cheatsheet.sh | rofi -dmenu -p 'keybinds'"
      "$mod, f, fullscreen"
      "$mod, q, killactive"
      "$mod SHIFT, f, togglefloating"

      # Window movement
      "$mod SHIFT, h, movewindow, l"
      "$mod SHIFT, j, movewindow, d"
      "$mod SHIFT, k, movewindow, u"
      "$mod SHIFT, l, movewindow, r"
      "$mod CTRL, h, moveintogroup, l"
      "$mod CTRL, j, moveintogroup, d"
      "$mod CTRL, k, moveintogroup, u"
      "$mod CTRL, l, moveintogroup, r"

      # Window navigation
      "$mod, h, movefocus, l"
      "$mod, j, movefocus, d"
      "$mod, k, movefocus, u"
      "$mod, l, movefocus, r"
      "$mod, G, exec, hyprctl --batch \"dispatch togglegroup ; dispatch forcerendererreload\""
      "$mod, TAB, changegroupactive, f"
      "$mod SHIFT, TAB, changegroupactive, b"

      # Workspace switching
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"

      # Move window to workspace
      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"
      "$mod SHIFT, 6, movetoworkspace, 6"
      "$mod SHIFT, 7, movetoworkspace, 7"
      "$mod SHIFT, 8, movetoworkspace, 8"
      "$mod SHIFT, 9, movetoworkspace, 9"
    ];

    # Media key binds (repeat on hold)
    bindl = [
      ", XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
      ", XF86AudioMute,        exec, swayosd-client --output-volume mute-toggle"
      ", XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise"
      ", XF86MonBrightnessUp,  exec, swayosd-client --brightness lower"
      ", XF86MonBrightnessDown,exec, swayosd-client --brightness raise"
    ];

    # Mouse binds
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
  };
}
