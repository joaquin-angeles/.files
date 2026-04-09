{ ... }:

{
  imports = [
    ./config.nix
  ];

  programs.foot = {
    enable = true;
    # server.enable = true;
  };
}
