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
    update.onActivation = true;

    # Base overrides (always applied)
    overrides = {
      global = {
        Context = {
          filesystems = [
            # Font package access
            "/nix/store:ro"
            "/run/current-system/sw/share/X11/fonts:ro"

            # Theming configurations
            "xdg-data/themes:ro"
            "xdg-data/icons:ro"

            # GTK settings
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
    };
  };
}
