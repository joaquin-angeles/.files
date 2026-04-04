{ config, pkgs, ... }:

{
  # GTK theming
  gtk = {
    enable = true;
    theme = {
      name = "Gruvbox-Dark";
      package = pkgs.gruvbox-gtk-theme;
    };

    gtk3 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
        gtk-decoration-layout = ":";
      };

      extraCss = ''
        /* No (default) titlebar on wayland */
        headerbar.titlebar.default-decoration {
          background: transparent;
          padding: 0;
          margin: 0 0 -17px 0;
          border: 0;
          min-height: 0;
          font-size: 0;
          box-shadow: none;
        }

        /* rm -rf window shadows */
        window.csd,
        window.csd decoration {
          box-shadow: none;
        }
      '';
    };

    gtk4 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
        gtk-decoration-layout = ":";
      };

      extraCss = ''
        /* No (default) titlebar on wayland */
        headerbar.titlebar.default-decoration {
          background: transparent;
          padding: 0;
          margin: 0 0 -17px 0;
          border: 0;
          min-height: 0;
          font-size: 0;
          box-shadow: none;
        }

        /* rm -rf window shadows */
        window.csd {
          box-shadow: none;
        }
      '';
    };
  };
  xfconf.settings = {
    thunar = {
      misc-terminal-emulator = "foot";
      misc-use-csd = false;
      misc-window-decorations = false;
    };
    exo = {
      ExoHelper-1-TerminalEmulator = "foot";
    };
  };
  home.file.".config/xfce4/helpers.rc".text = ''
    [Default Applications]
    TerminalEmulator=foot
  '';

  # GTK4 dark theme
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        gtk-decoration-layout = ":";
      };
    };
  };

  # Overwritten config files
  xdg.configFile."gtk-4.0/settings.ini".force = true;
  xdg.configFile."gtk-4.0/assets".source =
    "${pkgs.gruvbox-gtk-theme}/share/themes/Gruvbox-Dark/gtk-4.0/assets";
  xdg.configFile."gtk-4.0/gtk.css".source =
    "${pkgs.gruvbox-gtk-theme}/share/themes/Gruvbox-Dark/gtk-4.0/gtk.css";
  xdg.configFile."gtk-4.0/gtk-dark.css".source =
    "${pkgs.gruvbox-gtk-theme}/share/themes/Gruvbox-Dark/gtk-4.0/gtk-dark.css";
}
