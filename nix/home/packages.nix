{ ... }:

{
  imports = [
    ./packages/archives.nix
    ./packages/cli.nix
    ./packages/flatpaks.nix
    ./packages/media.nix
    ./packages/scripts.nix
    ./packages/themes.nix
    ./packages/wayland.nix
  ];
}
