{ config, ... }:

{
  services.flatpak.packages = [
    "com.usebottles.bottles" # Windows applications
    "dev.vencord.Vesktop" # Discord
    "org.chromium.Chromium" # Progressive web apps
    # "org.libreoffice.LibreOffice"     # Office suite
    "org.onlyoffice.desktopeditors" # Office suite
    "org.gimp.GIMP" # Photo editing software
    "org.vinegarhq.Sober" # Roblox

    # Minecraft Bedrock
    {
      appId = "io.mrarm.mcpelauncher";
      origin = "flathub-beta";
    }
  ];

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
    icon = "itunes";
    terminal = false;
    settings = {
      X-Flatpak-Part-Of = "org.chromium.Chromium";
      TryExec = "${config.xdg.dataHome}/flatpak/exports/bin/org.chromium.Chromium";
    };
  };
}
