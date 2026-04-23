{ ... }:

{
  imports = [
    ./packages/cli.nix
    ./packages/file-manager.nix
    ./packages/flatpaks.nix
    ./packages/media.nix
    ./packages/scripts.nix
    ./packages/themes.nix
    ./packages/wayland.nix
  ];
}
