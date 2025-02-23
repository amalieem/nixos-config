{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, nixpkgs, home-manager }: {
    nixosConfigurations.bennet = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ({ config, pkgs, ... }: {
          nixpkgs.overlays = [
            (import ./overlays/electron-wayland.nix)
          ];
        })

        ./hosts/bennet/configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users = {
            "amalieem" = import ./hosts/bennet/home.nix;
          };
        }
      ];
    };
  };
}
