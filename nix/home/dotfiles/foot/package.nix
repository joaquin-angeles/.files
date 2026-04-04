{ ... }:

{
  imports = [
    ./config/settings.nix
    ./config/theme.nix
  ];

  programs.foot = {
    enable = true;
    # server.enable = true;
  };
}
