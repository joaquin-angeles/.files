{ ... }:

{
  services.flatpak = {
    packages = [
      # Applications
      "dev.vencord.Vesktop" # Discord
      "org.chromium.Chromium" # Progressive web apps
      "org.onlyoffice.desktopeditors" # Office suite

      # Media
      "io.github.celluloid_player.Celluloid" # Video player
      "org.gimp.GIMP" # Image editor
    ];
  };
}
