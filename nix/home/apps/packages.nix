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
    grim
    hyprlock
    impala
    lazygit
    mako
    poppler
    ripgrep
    slurp
    stow
    sunsetr
    swayidle
    swayosd
    waybar
    wayfreeze
    wbg
    wideriver
    wlr-randr
    wlopm
    xfce.exo
    xfce.tumbler
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
