{ pkgs, ... }:

{
  imports = [
    ./init.nix
    ./keymaps.nix
    ./plugins.nix
    ./settings.nix
    ./theme.nix
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
