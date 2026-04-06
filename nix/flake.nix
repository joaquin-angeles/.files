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

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nix-flatpak,
      ...
    }@inputs:
    let
      hostSystem = "x86_64-linux";
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];

      mkOverlay = system: _: prev: {
        unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      };

      pkgsFor =
        system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [ (mkOverlay system) ];
        };
    in
    {
      nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
        system = hostSystem;
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
              overlays = [ (mkOverlay hostSystem) ];
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

      homeConfigurations = nixpkgs.lib.genAttrs systems (
        system:
        home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsFor system;
          extraSpecialArgs = { inherit inputs; };
          modules = [
            ./home.nix
            nix-flatpak.homeManagerModules.nix-flatpak
          ];
        }
      );
    };
}
