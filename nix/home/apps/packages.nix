{ config, pkgs, ... }:

{
  imports = [
    ./packages/flatpaks.nix
    ./packages/media.nix
    ./packages/scripts.nix
  ];

  # User packages
  home.packages = with pkgs; [
    cliphist
    file-roller
    hyprshot
    impala
    lazygit
    mako
    ripgrep
    sunsetr
    swayidle
    swaylock
    waybar
    wbg
    wideriver
    wlr-randr
    zellij
  ];

  # Facebook Messenger
  xdg.desktopEntries.messenger = {
    name = "Messenger";
    exec = "flatpak run org.chromium.Chromium --app=https://www.facebook.com/messages/";
    icon = "fbmessenger";
    terminal = false;
    settings = {
      X-Flatpak-Part-Of = "org.chromium.Chromium";
      TryExec = "${config.home.homeDirectory}/.local/share/flatpak/exports/bin/org.chromium.Chromium";
    };
  };
}
