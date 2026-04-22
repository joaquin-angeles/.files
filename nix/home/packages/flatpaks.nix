{ config, ... }:

{
  services.flatpak.packages = [
    "com.usebottles.bottles" # Windows applications
    "dev.vencord.Vesktop" # Discord
    "io.github.ungoogled_software.ungoogled_chromium" # Progressive web apps
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
    exec = "flatpak run io.github.ungoogled_software.ungoogled_chromium --app=https://www.facebook.com/messages/";
    icon = "fbmessenger";
    terminal = false;
    settings = {
      X-Flatpak-Part-Of = "io.github.ungoogled_software.ungoogled_chromium";
      TryExec = "${config.xdg.dataHome}/flatpak/exports/bin/io.github.ungoogled_software.ungoogled_chromium";
    };
  };

  # Claude LLM
  xdg.desktopEntries.claude = {
    name = "Claude AI";
    exec = "flatpak run io.github.ungoogled_software.ungoogled_chromium --app=https://claude.ai";
    terminal = false;
    settings = {
      X-Flatpak-Part-Of = "io.github.ungoogled_software.ungoogled_chromium";
      TryExec = "${config.xdg.dataHome}/flatpak/exports/bin/io.github.ungoogled_software.ungoogled_chromium";
    };
  };
}
