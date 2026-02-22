{
    description = "Phanes' NixOS configuration";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";           # Stable
        nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable"; # Rolling
        nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";  # Flatpak support

        home-manager = {
            url = "github:nix-community/home-manager/release-25.11";
            inputs.nixpkgs.follows = "nixpkgs"; # Use stable nixpkgs
        };
    };

    outputs = { self, nixpkgs, nixpkgs-unstable, nix-flatpak, home-manager, ... }@inputs:
        let
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
        in
        {
            nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
                inherit system;
                specialArgs = { inherit inputs; };
                modules = [
                    # Host configuration
                    ./host.nix
                    ./host/apps.nix
                    ./host/hardware.nix
                    ./host/services.nix
                    /etc/nixos/hardware-configuration.nix # Auto-generated

                    home-manager.nixosModules.home-manager

                    {
                        nixpkgs = {
                            config.allowUnfree = true; # Allow proprietary packages
                            overlays = [
                                # Expose unstable packages as pkgs.unstable
                                (final: prev: {
                                    unstable = import nixpkgs-unstable {
                                        inherit system;
                                        config.allowUnfree = true;
                                    };
                                })
                            ];
                        };

                        home-manager = {
                            backupFileExtension = "bak";       # Back up conflicting files
                            useGlobalPkgs = true;              # Share system nixpkgs
                            useUserPackages = true;            # Install to user profile
                            extraSpecialArgs = { inherit inputs; };
                            sharedModules = [ nix-flatpak.homeManagerModules.nix-flatpak ];
                            users.joaquin = import ./home.nix; # User config
                        };
                    }
                ];
            };

            # Home Manager configuration
            homeConfigurations.joaquin = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                extraSpecialArgs = { inherit inputs; };
                modules = [
                    ./home.nix

                    nix-flatpak.homeManagerModules.nix-flatpak
                    {
                        nixpkgs = {
                            config.allowUnfree = true;
                            overlays = [
                                # Same unstable overlay as NixOS config
                                (final: prev: {
                                    unstable = import nixpkgs-unstable {
                                        inherit system;
                                        config.allowUnfree = true;
                                    };
                                })
                            ];
                        };

                        # Required for standalone mode
                        home = {
                            username = "joaquin";
                            homeDirectory = "/home/joaquin";
                        };
                    }
                ];
            };
        };
}
