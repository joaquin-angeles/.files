{...}: {
  services.flatpak.packages = [
    "app.zen_browser.zen" # Default browser
    "com.github.tchx84.Flatseal"
    "com.obsproject.Studio" # Screen recording software
    "com.usebottles.bottles" # Windows applications
    "com.vysp3r.ProtonPlus" # Games compatibility tool
    "com.spotify.Client" # Music streaming
    "dev.vencord.Vesktop" # Discord
    "com.modrinth.ModrinthApp"
    "io.mrarm.mcpelauncher" # Minecraft Bedrock
    # "net.lutris.Lutris"               # Game launcher
    "org.chromium.Chromium" # Progressive web apps
    # "org.libreoffice.LibreOffice"     # Office suite
    "org.onlyoffice.desktopeditors" # Office suite
    "org.gimp.GIMP" # Photo editing software
    "org.vinegarhq.Sober" # Roblox
  ];
}
