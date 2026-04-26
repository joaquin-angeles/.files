{ pkgs, ... }:

let
  importPkg = f: import f { inherit pkgs; };
in
{
  home.packages = map importPkg [
    ./grimshot.nix
    ./mako-osd.nix
    ./wlpower.nix
  ];
}
