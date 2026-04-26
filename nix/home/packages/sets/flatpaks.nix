{ config, ... }:

{
  services.flatpak = {
    packages = [
      # Applications
      "dev.vencord.Vesktop" # Discord
      "org.chromium.Chromium" # Progressive web apps
      "org.onlyoffice.desktopeditors" # Office suite

      # Gaming
      "com.usebottles.bottles" # Launcher / Wine prefix manager
      "org.vinegarhq.Sober" # Roblox
      {
        # Wine version installer
        appId = "com.vysp3r.ProtonPlus";
        origin = "flathub-beta";
      }
      {
        # Minecraft Bedrock
        appId = "io.mrarm.mcpelauncher";
        origin = "flathub-beta";
      }
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

  # Claude LLM
  xdg.desktopEntries.claude = {
    name = "Claude AI";
    exec = "flatpak run org.chromium.Chromium --app=https://claude.ai";
    icon = "android-messages-desktop";
    terminal = false;
    settings = {
      X-Flatpak-Part-Of = "org.chromium.Chromium";
      TryExec = "${config.xdg.dataHome}/flatpak/exports/bin/org.chromium.Chromium";
    };
  };

  # Apple Music
  xdg.desktopEntries.itunes = {
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
