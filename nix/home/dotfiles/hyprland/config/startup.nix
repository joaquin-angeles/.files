{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "eDP-1, 1920x1080@120, auto, 1.0"
    ];

    exec-once = [
      "rm ~/.cache/cliphist/db && cliphist.sh" # Clipboard history; wipe stale db on start
      "~/.local/bin/power-saver.sh"
      "waybar"
      # "nm-applet"
      "wbg ~/Pictures/Wallpapers/gruvbox/trees.png"
      "mako"
      "hypridle"
      "swayosd-server"
    ];

    misc = {
      force_default_wallpaper = 0;
      disable_hyprland_logo = true;
      background_color = "0x151515";
      vfr = true;
    };
  };
}
