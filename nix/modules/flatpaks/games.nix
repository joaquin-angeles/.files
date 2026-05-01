{ lib, features, ... }:

with lib;

let
  mkX11Only = {
    Context.sockets = [
      "!wayland"
      "x11"
      "!fallback-x11"
    ];
  };

  mkNvidia = {
    Environment = {
      "__GLX_VENDOR_LIBRARY_NAME" = "nvidia";
      "__NV_PRIME_RENDER_OFFLOAD" = "1";
      "__VK_LAYER_NV_optimus" = "NVIDIA_only";
    };
  };
in
{
  config = mkIf features.gaming.enable {
    services.flatpak = {
      packages = [
        "org.vinegarhq.Sober" # Roblox
        "io.mrarm.mcpelauncher" # Minecraft Bedrock

        # Extra gaming packages
        "com.vysp3r.ProtonPlus" # Wine installer
        "com.usebottles.Bottles" # Wine prefix manager / Run windows games
      ];

      # Variable overrides
      overrides = {
        # Roblox + Nvidia + X11
        "org.vinegarhq.Sober" = lib.mkMerge [
          mkNvidia
          mkX11Only
        ];

        "io.mrarm.mcpelauncher" = mkNvidia; # Minecraft + Nvidia
      };
    };
  };
}
