{ ... }:

{
  imports = [
    ./services/f2b.nix
    ./services/networking.nix
    ./services/nftables.nix
    ./services/polkit.nix
  ];

  programs.dconf.enable = true; # GTK settings
  services = {
    dbus.enable = true;
    flatpak.enable = true;
    gvfs.enable = true;
    # zerotierone.enable = true;
  };
}
