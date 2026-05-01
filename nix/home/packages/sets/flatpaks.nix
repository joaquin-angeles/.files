{ ... }:

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
}
