{ ... }:
{
  imports = [
    ./modules
  ];

  services = {
    dbus.enable = true;
    flatpak.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
    xserver.enable = false;
  };
}
