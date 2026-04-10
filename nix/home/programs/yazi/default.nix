{ pkgs, ... }:

{
  imports = [
    ./settings.nix
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
