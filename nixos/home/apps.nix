{ config, pkgs, ... }:

{
    imports = [
        ./apps/flatpaks.nix
        ./apps/fonts.nix
        ./apps/packages.nix
        ./apps/programs.nix
        ./apps/scripts.nix
    ];
}
