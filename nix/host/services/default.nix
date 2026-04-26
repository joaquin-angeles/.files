{ ... }:
{
  imports = [
    ./f2b.nix
    ./networking.nix
    ./nftables.nix
  ];
  services = {
    dbus.enable = true;
    flatpak.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
    xserver.enable = false;
  };
}
