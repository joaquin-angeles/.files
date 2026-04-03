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
    ffmpegthumbnailer
    file-roller
    grim
    hyprlock
    hyprpicker
    impala
    lazygit
    mako
    poppler-utils
    ripgrep
    rivercarro
    slurp
    stow
    sunsetr
    swayosd
    waybar
    wayfreeze
    wbg
    wlr-randr
    xfce.tumbler
    zellij

    # Nemo file manager
    (nemo-with-extensions.override {
      useDefaultExtensions = false;
      extensions = [ nemo-fileroller ];
    })
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
