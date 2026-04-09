{ ... }:

{
  imports = [
    ./config/integrations.nix
  ];

  programs.fish = {
    enable = true;
  };
}
