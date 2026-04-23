{ ... }:
{
  imports = [
    ./services/f2b.nix
    ./services/networking.nix
    ./services/nftables.nix
    ./services/polkit.nix
  ];
  services = {
    dbus.enable = true;
    flatpak.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
    xserver.enable = false;
  };
}
