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
        headerbar.titlebar.default-decoration {
          display: none;
          opacity: 0;
          background: transparent;
          padding: 0;
          margin: 0 0 -99px 0;
          border: 0;
          min-height: 0;
          font-size: 0;
          box-shadow: none;
        }

        headerbar.titlebar button.titlebutton {
          opacity: 0;
          background: transparent;
          pointer-events: none;
        }

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
