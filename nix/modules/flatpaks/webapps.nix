{ lib, features, ... }:

with lib;

{
  config = mkIf features.webapps.enable {
    # Webapp backend
    services.flatpak.packages = [ "org.chromium.Chromium" ];

    xdg.desktopEntries = {
      # Facebook Messenger
      messenger = {
        name = "Messenger";
        exec = "flatpak run org.chromium.Chromium --app=https://www.facebook.com/messages/";
        icon = "fbmessenger";
        terminal = false;
        settings.X-Flatpak-Part-Of = "org.chromium.Chromium";
      };

      # Music streaming (Apple Music)
      apple-music = {
        name = "Apple Music";
        exec = "flatpak run org.chromium.Chromium --app=https://music.apple.com";
        icon = "apple-music";
        terminal = false;
        settings.X-Flatpak-Part-Of = "org.chromium.Chromium";
      };
    };
  };
}
