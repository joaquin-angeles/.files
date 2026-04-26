{ ... }:
{
  imports = [
    ./modules/f2b.nix
    ./modules/networking.nix
    ./modules/nftables.nix
  ];
  services = {
    dbus.enable = true;
    flatpak.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
    xserver.enable = false;
  };
}
