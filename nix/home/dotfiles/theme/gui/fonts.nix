{
  config,
  pkgs,
  ...
}: {
  # Enable font configuration
  fonts.fontconfig.enable = true;

  # Font configurations
  fonts.fontconfig.defaultFonts = {
    emoji = ["Blobmoji"];
    monospace = ["JetBrainsMono Nerd Font Mono"];
    # monospace = [ "MesloLGM Nerd Font Mono" ];
    sansSerif = ["Inter"];
    serif = ["Times New Roman"];
  };

  # Flatpak font correction
  home.activation.flatpakFonts = config.lib.dag.entryAfter ["writeBoundary"] ''
    # Make font directory
    $DRY_RUN_CMD mkdir -p "$HOME/.local/share/fonts"

    # Font packages
    for pkg in \
        ${pkgs.corefonts} \
        ${pkgs.inter} \
        ${pkgs.nerd-fonts.jetbrains-mono} \
        ${pkgs.nerd-fonts.meslo-lg} \
        ${pkgs.noto-fonts} \
        ${pkgs.noto-fonts-cjk-sans} \
        ${pkgs.noto-fonts-emoji-blob-bin}
    do
        $DRY_RUN_CMD find "$pkg/share/fonts" -type f \
            -exec ln -sfn {} "$HOME/.local/share/fonts/" \;
    done

    # Refresh font cache
    $DRY_RUN_CMD fc-cache -fv || true
  '';
}
