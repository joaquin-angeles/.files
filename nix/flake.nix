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
    {
      nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./host
          /etc/nixos/hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
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
            home-manager = {
              backupFileExtension = "bak";
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              sharedModules = [ nix-flatpak.homeManagerModules.nix-flatpak ];
              users.joaquin = import ./home;
            };
          }
        ];
      };
    };
}
