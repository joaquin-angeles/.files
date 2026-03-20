{ ... }:

{
  imports = [
    ./config/keybinds.nix
    ./config/animations.nix
    ./config/appearance.nix
    ./config/input.nix
    ./config/layout.nix
    ./config/startup.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$browser" = "bash -c 'zen || flatpak run app.zen_browser.zen'";
      "$fileManager" = "nautilus";
      "$menu" = "rofi -show drun";
      "$mod" = "SUPER";
      "$term" = "alacritty";

      ecosystem = {
        no_update_news = true;
      };
    };
  };
}
