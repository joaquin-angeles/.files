{ config, lib, ... }:

{
  services.flatpak = {
    enable = true;

    # Repositories
    remotes = lib.mkOptionDefault [
      # Explicitly set
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }

      # Unstable branch
      {
        name = "flathub-beta";
        location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
      }
    ];

    uninstallUnmanaged = true; # True declarative
    update.onActivation = false; # Update every rebuild

    # Scheduled updating
    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };
  };

  # Settings
  services.flatpak.overrides = {
    # Global options
    global = {
      # File access
      Context.filesystems = [
        # Application access
        "/nix/store:ro"
        "${config.xdg.dataHome}/applications"
        "${config.xdg.dataHome}/fonts:ro"
        "${config.xdg.dataHome}/themes:ro"

        # GTK configuration
        "xdg-config/gtk-3.0:ro"
        "xdg-config/gtk-4.0:ro"
        "xdg-config/dconf:ro"
        "xdg-run/dconf"
      ];

      # Device access
      Context = {
        devices = [ "dri" ]; # GPU access
      };

      "Session Bus Policy" = {
        "ca.desrt.dconf" = "talk";
      };

      # Environmental variables
      Environment = {
        "GTK_THEME" = "Gruvbox-Dark:dark";
        "GTK_APPLICATION_PREFER_DARK_THEME" = "1";
        "DCONF_USER_CONFIG_DIR" = "${config.home.username}.config/dconf";
      };
    };

    "org.vinegarhq.Sober" = {
      Environment = {
        "__GLX_VENDOR_LIBRARY_NAME" = "nvidia";
        "__NV_PRIME_RENDER_OFFLOAD" = "1";
        "__VK_LAYER_NV_optimus" = "NVIDIA_only";
      };
    };

    "io.mrarm.mcpelauncher" = {
      Environment = {
        "__GLX_VENDOR_LIBRARY_NAME" = "nvidia";
        "__NV_PRIME_RENDER_OFFLOAD" = "1";
        "__VK_LAYER_NV_optimus" = "NVIDIA_only";
      };
    };

    "com.github.tchx84.Flatseal" = {
      Environment = {
        "GTK_THEME" = "adw-gtk3-dark:dark";
      };
      Context.filesystems = [
        "!xdg-config/gtk-3.0"
        "!xdg-config/gtk-4.0"
      ];
    };
  };
}
