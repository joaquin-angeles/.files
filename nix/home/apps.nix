{ config, pkgs, ... }:

{
    imports = [
        ./apps/packages.nix
        ./apps/programs.nix
    ];
}
