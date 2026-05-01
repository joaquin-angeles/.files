{ lib, features, ... }:

with lib;

{
  config = mkIf features.webapps.enable {
    xdg.desktopEntries = {
      messenger = {
        name = "Messenger";
        exec = "flatpak run org.chromium.Chromium --app=https://www.facebook.com/messages/";
        icon = "fbmessenger";
        terminal = false;
        settings = {
          X-Flatpak-Part-Of = "org.chromium.Chromium";
        };
      };

      apple-music = {
        name = "Apple Music";
        exec = "flatpak run org.chromium.Chromium --app=https://music.apple.com";
        icon = "apple-music";
        terminal = false;
        settings = {
          X-Flatpak-Part-Of = "org.chromium.Chromium";
        };
      };
    };
  };
}
