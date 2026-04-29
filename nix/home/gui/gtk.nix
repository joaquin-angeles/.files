{ pkgs, ... }:

{
  # Theme manager
  home.packages = with pkgs; [
    nwg-look
  ];

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
        /* No title bar on wayland */
        headerbar.default-decoration {
          margin-bottom: 50px;
          margin-top: -100px;
        }

        /* rm -rf window shadows */
        window.csd, /* gtk4? */
        window.csd decoration {
          /* gtk3 */
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
        /* No title bar on wayland */
        headerbar.default-decoration {
          margin-bottom: 50px;
          margin-top: -100px;
        }

        /* rm -rf window shadows */
        window.csd, /* gtk4? */
        window.csd decoration {
          /* gtk3 */
          box-shadow: none;
        }
      '';
    };
  };

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
  xdg.configFile = {
    "gtk-4.0/settings.ini".force = true;
    "gtk-4.0/assets".source = "${pkgs.gruvbox-gtk-theme}/share/themes/Gruvbox-Dark/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source =
      "${pkgs.gruvbox-gtk-theme}/share/themes/Gruvbox-Dark/gtk-4.0/gtk-dark.css";

    "gtk-4.0/gtk-dark.css".source =
      "${pkgs.gruvbox-gtk-theme}/share/themes/Gruvbox-Dark/gtk-4.0/gtk-dark.css";
  };
}
