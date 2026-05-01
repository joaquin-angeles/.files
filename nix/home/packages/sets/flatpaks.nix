{ lib, features, ... }:

with lib;

let
  gamingApps = [
    "org.vinegarhq.Sober"
    "io.mrarm.mcpelauncher"
  ];

  gamingOverrides = lib.genAttrs gamingApps (_: {
    Context.sockets = [
      "!wayland"
      "x11"
      "!fallback-x11"
    ];
    Environment = {
      "__GLX_VENDOR_LIBRARY_NAME" = "nvidia";
      "__NV_PRIME_RENDER_OFFLOAD" = "1";
      "__VK_LAYER_NV_optimus" = "NVIDIA_only";
    };
  });
in
{
  services.flatpak = {
    packages = [
      # Applications
      "dev.vencord.Vesktop" # Discord
      "io.github.celluloid_player.Celluloid"
      "org.chromium.Chromium" # Progressive web apps
      "org.gimp.GIMP"
      "org.onlyoffice.desktopeditors" # Office suite
    ]
    # Install gaming packages when enabled
    ++ optionals features.gaming.enable gamingApps;

    # Gaming specific overrides
    overrides = mkIf features.gaming.enable gamingOverrides;
  };
}
