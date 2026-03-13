{ ... }:

{
    imports = [
        ./services/f2b.nix
        ./services/flatpak.nix
        ./services/networking.nix
        ./services/nftables.nix
        ./services/polkit.nix
    ];
    
    services.dbus.enable = true; # DBus support
    services.gvfs.enable = true; # Trash implementation on FS
    # services.zerotierone.enable = true; # Virtual network manager
}
