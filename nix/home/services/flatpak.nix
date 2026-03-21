{ ... }:
{
  services.flatpak = {
    enable = true;

    # Repositories
    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      } # Explicitly set
      {
        name = "flathub-beta";
        location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
      } # Unstable branch
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
      # Environmental variables
      Environment = {
        "GTK_THEME" = "Gruvbox-Dark:dark";
        "GTK_APPLICATION_PREFER_DARK_THEME" = "1";
        "DCONF_USER_CONFIG_DIR" = ".config/dconf";
      };

      # Device access
      Context = {
        devices = [ "dri" ]; # GPU access
      };

      # File access
      Context.filesystems = [
        "/nix/store:ro"
        "~/.local/share/icons:ro"
        "~/.local/share/applications:ro"
        "~/.local/share/fonts:ro"
        "~/.cache/fontconfig:ro"

        # GTK Theming and icon access
        "~/.local/share/themes:ro"
        "xdg-config/gtk-3.0:ro"
        "xdg-config/gtk-4.0:ro"
        "xdg-data/themes:ro"
        "xdg-data/icons:ro"
        "~/.config/dconf:ro"
        "xdg-run/dconf"
      ];

      "Session Bus Policy" = {
        "ca.desrt.dconf" = "talk";
      };
    };

    # Libadwaita themes for badly themed packages
    "app.zen_browser.zen" = {
      Environment = {
        "GTK_THEME" = "adw-gtk3-dark";
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

    # Vesktop config
    "dev.vencord.Vesktop" = {
      Context.filesystems = [
        "home:ro"
      ];
    };

    "org.vinegarhq.Sober" = {
      Environment = {
        "__GLX_VENDOR_LIBRARY_NAME" = "nvidia";
        "__NV_PRIME_RENDER_OFFLOAD" = "1";
        "__VK_LAYER_NV_optimus" = "NVIDIA_only";
      };
    };
  };
}
