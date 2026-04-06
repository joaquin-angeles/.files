{ lib, pkgs, ... }:

{
  # Enable font configuration
  fonts.fontconfig.enable = true;

  # Font configurations
  fonts.fontconfig.defaultFonts = {
    emoji = [ "Noto Color Emoji" ];
    monospace = [ "JetBrainsMono Nerd Font Mono" ];
    # monospace = [ "MesloLGM Nerd Font Mono" ];
    sansSerif = [ "Inter" ];
    serif = [ "Times New Roman" ];
  };

  home.activation.flatpakFonts = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p "$HOME/.local/share/fonts"
    $DRY_RUN_CMD cp -r /run/current-system/sw/share/X11/fonts/. "$HOME/.local/share/fonts/"
    $DRY_RUN_CMD ${pkgs.fontconfig}/bin/fc-cache -f
  '';
}
