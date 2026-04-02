{
  description = "Gruvforest: An environment of organic minimalism";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11"; # stable
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable"; # unstable
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest"; # declarative flatpaks

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11"; # user dotfiles/packages
      inputs.nixpkgs.follows = "nixpkgs"; # pin to stable
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nix-flatpak,
      ...
    }@inputs:
    let
      hostSystem = "x86_64-linux"; # this machine

      systems = [
        # all supported systems
        "x86_64-linux"
        "aarch64-linux"
      ];

      forAllSystems = nixpkgs.lib.genAttrs systems; # map over systems

      unstableOverlay = system: final: prev: {
        # pkgs.unstable.*
        unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      };

      pkgsFor = # stable pkgs + overlays for a given system
        system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [
            (unstableOverlay system)
          ];
        };
    in
    {
      nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
        # system config
        system = hostSystem;
        specialArgs = { inherit inputs; }; # pass flake inputs to modules
        modules = [
          ./host.nix
          ./host/apps.nix
          ./host/hardware.nix
          ./host/services.nix
          /etc/nixos/hardware-configuration.nix # machine-generated
          home-manager.nixosModules.home-manager
          {
            nixpkgs.config.allowUnfree = true;
            nixpkgs.overlays = [
              (unstableOverlay hostSystem)
            ];

            home-manager = {
              backupFileExtension = "bak"; # back up conflicting files
              useGlobalPkgs = true; # share system pkgs
              useUserPackages = true; # install into /etc/profiles
              extraSpecialArgs = { inherit inputs; };
              sharedModules = [ nix-flatpak.homeManagerModules.nix-flatpak ];
              users.joaquin = import ./home.nix;
            };
          }
        ];
      };

      homeConfigurations = forAllSystems (
        # standalone, non-NixOS
        system:
        home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsFor system;
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
        }
      );
    };
}
