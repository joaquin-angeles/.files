{ ... }:

{
  networking = {
    hostName = "nixos-btw"; # Define a hostname

    # Network service
    wireless.iwd = {
      enable = true;
      settings.General.EnableNetworkConfiguration = true;
    };

    # Disable network manager
    networkmanager.enable = false;
  };

  services.resolved = {
    enable = true;
    fallbackDns = [
      "1.1.1.1"
      "8.8.8.8"
    ];
  };

  # Virtual network manager
  # services.zerotierone.enable = true;
}
