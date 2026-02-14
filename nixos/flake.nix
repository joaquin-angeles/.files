{
    description = "Gruvvy NixOS";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11"; # Stable nixpkgs
        nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest"; # Flatpaks
        unstable.url = "github:NixOS/nixpkgs/nixos-unstable"; # Rolling nixpkgs

        # Home manager
        home-manager = {
            url = "github:nix-community/home-manager/release-25.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1"; # Wayland compositor
    };

    # Main integrations
    outputs = inputs@{ self, nixpkgs, nix-flatpak, unstable, home-manager, hyprland, ... }: {
        # Imported configurations
        nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };
            modules = [
                # System configuration
                ./core.nix

                # Program configs
                ./core/apps.nix
                ./core/hardware.nix
                ./core/services.nix

                # Automated hardware config
                /etc/nixos/hardware-configuration.nix

                # Hyprland
                hyprland.nixosModules.default

                # User config
                home-manager.nixosModules.home-manager
                {
                    nixpkgs.config.allowUnfree = true; # Allow proprietary
                    home-manager = {
                        backupFileExtension = "bak";            # Fallback for existing files
                        users.joaquin = import ./home.nix;      # Main configuration file
                        useGlobalPkgs = true;                   # Merge into packages
                        useUserPackages = true;                 # Utilize per-user package installation
                        extraSpecialArgs = { inherit inputs; }; # Accept inputs 
                        sharedModules = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];
                    };
                }

                # Package overlays
                {
                    nixpkgs.overlays = [
                        (final: prev: {
                            # Overlay the unstable input
                            unstable = import inputs.unstable {
                                inherit (prev.stdenv.hostPlatform) system;
                                config = prev.config;
                            };
                        })
                    ];
                }
            ];
        };
    };
}
