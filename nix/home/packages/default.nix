{ ... }:

{
  imports = [
    # Packages
    ./modules/cli.nix
    ./modules/file-manager.nix
    ./modules/flatpaks.nix
    ./modules/media.nix
    ./modules/scripts.nix
    ./modules/wayland.nix

    # Custom packages
    ./derivations
  ];
}
