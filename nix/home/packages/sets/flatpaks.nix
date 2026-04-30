{ config, ... }:

{
  services.flatpak = {
    packages = [
      # Applications
      "dev.vencord.Vesktop" # Discord
      "io.github.celluloid_player.Celluloid"
      "org.chromium.Chromium" # Progressive web apps
      "org.gimp.GIMP"
      "org.onlyoffice.desktopeditors" # Office suite
    ];
  };

  # Facebook Messenger
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

  # Apple Music
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
}
