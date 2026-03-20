{
  config,
  pkgs,
  ...
}:
{
  # GTK theming
  gtk = {
    enable = true;
    theme = {
      name = "Gruvbox-Dark";
      package = pkgs.gruvbox-gtk-theme;
    };

    # Enable dark theme
    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
  };

  # GTK4 dark theme
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        "color-scheme" = "prefer-dark";
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

  # Flatpak GTK theme correction
  home.activation.flatpakGtkThemes = config.lib.dag.entryAfter [ "writeBoundary" ] ''
    # Correct directory
    $DRY_RUN_CMD mkdir -p "$HOME/.local/share/themes"

    # Theme packages
    for pkg in \
        ${pkgs.gruvbox-gtk-theme} \
        ${pkgs.adw-gtk3}
    do
        $DRY_RUN_CMD find "$pkg/share/themes" -mindepth 1 -maxdepth 1 -type d \
            -exec ln -sfn {} "$HOME/.local/share/themes/" \;
    done
  '';
}
