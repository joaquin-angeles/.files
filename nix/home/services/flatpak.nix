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

    packages = [
      "com.usebottles.bottles" # Windows applications
      "dev.vencord.Vesktop" # Discord
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

    overrides = {
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
          "xdg-config/gtk-3.0"
          "xdg-config/gtk-4.0"
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
          "DCONF_USER_CONFIG_DIR" = "${config.xdg.configHome}/dconf";
        };
      };

      "org.vinegarhq.Sober" = {
        Context = {
          sockets = [
            "!wayland"
            "x11"
            "!fallback-x11"
          ];
        };
        Environment = {
          "__GLX_VENDOR_LIBRARY_NAME" = "nvidia";
          "__NV_PRIME_RENDER_OFFLOAD" = "1";
          "__VK_LAYER_NV_optimus" = "NVIDIA_only";
        };
      };

      "io.mrarm.mcpelauncher" = {
        Context = {
          sockets = [
            "!wayland"
            "x11"
            "!fallback-x11"
          ];
        };
        Environment = {
          "__GLX_VENDOR_LIBRARY_NAME" = "nvidia";
          "__NV_PRIME_RENDER_OFFLOAD" = "1";
          "__VK_LAYER_NV_optimus" = "NVIDIA_only";
        };
      };
    };
  };

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

  # Apple Music
  xdg.desktopEntries.itunes = {
    name = "Apple Music";
    exec = "flatpak run org.chromium.Chromium --app=https://music.apple.com";
    icon = "itunes";
    terminal = false;
    settings = {
      X-Flatpak-Part-Of = "org.chromium.Chromium";
      TryExec = "${config.xdg.dataHome}/flatpak/exports/bin/org.chromium.Chromium";
    };
  };
}
