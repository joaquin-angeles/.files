{ pkgs, ... }:

{
  # XDG portal setup (needed for Flatpak + Wayland apps)
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;

    # Wayland portal backend (wlroots-based compositors)
    wlr.enable = true;

    # GTK portal for file dialogs, etc.
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

    # Default portal selection per session
    config = {
      common.default = [ "gtk" ];
      river.default = [
        "wlr"
        "gtk"
      ];
    };
  };
}
