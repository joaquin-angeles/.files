{ config, lib, ... }:

{
  services.flatpak = {
    enable = true;

    remotes = lib.mkOptionDefault [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
      {
        name = "flathub-beta";
        location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
      }
    ];

    uninstallUnmanaged = true;

    update = {
      onActivation = false;
      auto = {
        enable = true;
        onCalendar = "weekly";
      };
    };

    overrides = {
      global = {
        Context = {
          filesystems = [
            "/nix/store:ro"
            "xdg-data/fonts:ro"
            "xdg-data/themes:ro"
            "xdg-data/icons:ro"
            "xdg-config/gtk-3.0:ro"
            "xdg-config/gtk-4.0:ro"
            "xdg-config/dconf"
            "xdg-run/dconf"
          ];
          devices = [ "dri" ];
        };
        "Session Bus Policy"."ca.desrt.dconf" = "talk";
        Environment = {
          "GTK_THEME" = "Gruvbox-Dark:dark";
          "DCONF_USER_CONFIG_DIR" = "${config.xdg.configHome}/dconf";
        };
      };
    }
    //
      lib.genAttrs
        # Games
        [
          "org.vinegarhq.Sober"
          "io.mrarm.mcpelauncher"
        ]
        (_: {
          # Gaming focused variables
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
  };
}
