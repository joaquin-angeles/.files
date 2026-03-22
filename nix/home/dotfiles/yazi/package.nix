{ pkgs, ... }:

{
  imports = [
    ./config/keymaps.nix
    ./config/settings.nix
    ./config/plugins.nix
    ./config/theme.nix
  ];

  programs.yazi = {
    # Prerequisites
    enable = true;
    enableZshIntegration = true; # Shell integration

    # Previewers
    extraPackages = with pkgs; [
      ffmpegthumbnailer
      file
      poppler
    ];
  };
}
