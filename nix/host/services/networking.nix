{ ... }:

{
    networking = {
        hostName = "nixos-btw"; # Define a hostname
        wireless.iwd.enable = true; # iwd > wpa_supplicant

        # Network manager
        networkmanager.enable = true;
        networkmanager.wifi.backend = "iwd"; # Use iwd
    };
}
