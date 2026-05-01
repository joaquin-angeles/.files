{
  description = "Gruvforest: An environment of organic minimalism";
  inputs = {
    # Nix package repositories
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11"; # Stable
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable"; # Rolling release

    # User configuration
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest"; # Declarative flatpaks (user-level only)
  };
  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nix-flatpak,
      ...
    }@inputs:
    {
      nixosConfigurations.gruvforest = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [

          # System modules
          ./host
          /etc/nixos/hardware-configuration.nix

          # Optional features
          ./features.nix
          ./modules/gaming.nix

          home-manager.nixosModules.home-manager # Load home-manager

          (
            { config, ... }:
            {
              # Nix package configuration
              nixpkgs = {
                config.allowUnfree = true;
                overlays = [
                  (_: prev: {
                    unstable = import nixpkgs-unstable {
                      system = "x86_64-linux";
                      config.allowUnfree = true;
                    };
                  })
                ];
              };

              # Home manager configuration
              home-manager = {
                backupFileExtension = "bak";
                useGlobalPkgs = true;
                useUserPackages = true;

                # Features and flags
                extraSpecialArgs = {
                  inherit inputs;
                  features = config.features;
                };

                # User modules
                sharedModules = [ nix-flatpak.homeManagerModules.nix-flatpak ];
                users.joaquin = {
                  imports = [
                    ./home
                    ./modules/flatpaks/games.nix # Flatpak gaming
                    ./modules/flatpaks/webapps.nix # Progressive web applications
                  ];
                };
              };
            }
          )
        ];
      };
    };
}
