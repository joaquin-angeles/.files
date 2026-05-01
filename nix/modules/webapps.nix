{ config, lib, ... }:

with lib;

let
  cfg = config.features.webapps;
in
{
  options.features.webapps.enable = mkEnableOption "PWA applications";

  config = mkIf cfg.enable {
    xdg.desktopEntries.messenger = {
      name = "Messenger";
      exec = "flatpak run org.chromium.Chromium --app=https://www.facebook.com/messages/";
      icon = "fbmessenger";
      terminal = false;
      settings = {
        X-Flatpak-Part-Of = "org.chromium.Chromium";
        TryExec = "${config.xdg.dataHome}/flatpak/exports/bin/org.chromium.Chromium";
      };
    };

    xdg.desktopEntries.apple-music = {
      name = "Apple Music";
      exec = "flatpak run org.chromium.Chromium --app=https://music.apple.com";
      icon = "apple-music";
      terminal = false;
      settings = {
        X-Flatpak-Part-Of = "org.chromium.Chromium";
        TryExec = "${config.xdg.dataHome}/flatpak/exports/bin/org.chromium.Chromium";
      };
    };
  };
}
