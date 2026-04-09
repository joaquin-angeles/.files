{ config, ... }:

{
  services.flatpak.packages = [
    "com.obsproject.Studio" # Screen recording software
    "com.usebottles.bottles" # Windows applications
    "com.vysp3r.ProtonPlus" # Games compatibility tool
    "dev.vencord.Vesktop" # Discord
    "com.modrinth.ModrinthApp"
    # "net.lutris.Lutris"               # Game launcher
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
}
