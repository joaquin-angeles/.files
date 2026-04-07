{ lib, pkgs, ... }:

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
  home.activation.flatpakThemes = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p "$HOME/.local/share/themes"

    for theme_dir in \
      "${pkgs.gruvbox-gtk-theme}/share/themes/"* \
      "${pkgs.adw-gtk3}/share/themes/"*; do
      theme_name=$(basename "$theme_dir")
      dest="$HOME/.local/share/themes/$theme_name"
      $DRY_RUN_CMD rm -rf "$dest"
      $DRY_RUN_CMD ln -s "$theme_dir" "$dest"
    done
  '';
}
