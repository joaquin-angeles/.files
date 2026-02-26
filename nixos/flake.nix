{
    description = "Gruvforest: An environment of organic minimalism";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
        nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
        nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

        home-manager = {
            url = "github:nix-community/home-manager/release-25.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, nixpkgs-unstable, nix-flatpak, home-manager, ... }@inputs:
        let
            system = "x86_64-linux";
            unstableOverlay = final: prev: {
                unstable = import nixpkgs-unstable {
                    inherit system;
                    config.allowUnfree = true;
                };
            };
            pkgs = import nixpkgs {
                inherit system;
                config.allowUnfree = true;
                overlays = [ unstableOverlay ];
            };
        in
            {
            nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
                inherit system;
                specialArgs = { inherit inputs; };
                modules = [
                    ./host.nix
                    ./host/apps.nix
                    ./host/hardware.nix
                    ./host/services.nix
                    /etc/nixos/hardware-configuration.nix

                    home-manager.nixosModules.home-manager

                    {
                        nixpkgs = {
                            config.allowUnfree = true;
                            overlays = [ unstableOverlay ]; # Shared overlay
                        };

                        home-manager = {
                            backupFileExtension = "bak";
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            extraSpecialArgs = { inherit inputs; };
                            sharedModules = [ nix-flatpak.homeManagerModules.nix-flatpak ];
                            users.joaquin = import ./home.nix;
                        };
                    }
                ];
            };

            homeConfigurations.joaquin = home-manager.lib.homeManagerConfiguration {
                inherit pkgs; # Now includes unstableOverlay
                extraSpecialArgs = { inherit inputs; };
                modules = [
                    ./home.nix
                    nix-flatpak.homeManagerModules.nix-flatpak
                    {
                        home = {
                            username = "joaquin";
                            homeDirectory = "/home/joaquin";
                        };
                    }
                ];
            };
        };
}
