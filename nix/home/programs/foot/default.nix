{ ... }:

{
  imports = [
    ./settings.nix
  ];

  programs.foot = {
    enable = true;
    # server.enable = true;
  };
}
