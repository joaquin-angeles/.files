{ ... }:
{
  networking = {
    hostName = "nixos-btw";
    wireless.iwd = {
      enable = true;
      settings.General.EnableNetworkConfiguration = true;
    };
    networkmanager.enable = false;
    useDHCP = false;
    dhcpcd.enable = false;
  };
  services.resolved = {
    enable = true;
    fallbackDns = [
      "1.1.1.1"
      "8.8.8.8"
    ];
  };
}
