{ ... }:

{
  imports = [
    ./settings.nix
    ./theme.nix
  ];

  programs.foot = {
    enable = true;
    # server.enable = true;
  };
}
