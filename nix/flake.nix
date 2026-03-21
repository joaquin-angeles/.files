{
  description = "Gruvforest: An environment of organic minimalism";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Dotfile configurations
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Declarative Flatpaks
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    # Browser app
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nix-flatpak,
      zen-browser,
      ...
    }@inputs:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      # Helper to generate attrs for each system
      forAllSystems = nixpkgs.lib.genAttrs systems;

      # Exposes pkgs.unstable throughout the config
      unstableOverlay = system: final: prev: {
        unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      };

      # Exposes pkgs.zen-browser throughout the config
      zenOverlay =
        system: final: prev:
        nixpkgs.lib.optionalAttrs (builtins.hasAttr system zen-browser.packages) {
          zen-browser = zen-browser.packages.${system}.default;
        };

      # Used by the standalone homeConfigurations output
      pkgsFor =
        system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [
            (unstableOverlay system)
            (zenOverlay system)
          ];
        };
    in
    {
      # NixOS system config (Linux only)
      nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./host.nix
          ./host/apps.nix
          ./host/hardware.nix
          ./host/services.nix
          /etc/nixos/hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
            nixpkgs.config.allowUnfree = true;
            nixpkgs.overlays = [
              (unstableOverlay "x86_64-linux")
              (zenOverlay "x86_64-linux")
            ];

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

      # Standalone config for non-NixOS systems (e.g. Fedora Silverblue, macOS)
      homeConfigurations = forAllSystems (
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
