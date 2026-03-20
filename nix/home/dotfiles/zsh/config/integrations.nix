{ pkgs, ... }:

{
  imports = [
    ./integrations/search.nix
    ./integrations/utils.nix
  ];

  # Nix output monitor
  programs.nix-your-shell = {
    enable = true;
    enableZshIntegration = true;
    nix-output-monitor.enable = true;
  };

  # Modern replacements
  home.packages = with pkgs; [
    dust
    ncdu
    procs
    sd
    tokei
    xh
  ];
}
