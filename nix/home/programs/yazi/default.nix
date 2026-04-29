{ pkgs, ... }:

{
  imports = [
    ./keymaps.nix
    ./plugins.nix
    ./settings.nix
    ./theme.nix
  ];

  programs.yazi = {
    # Prerequisites
    enable = true;
    enableZshIntegration = true; # Shell integration

    extraPackages = with pkgs; [
      # Previewers
      ffmpegthumbnailer
      file
      poppler
    ];
  };
}
