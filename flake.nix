{
  description = "Stuff for NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      ...
    }:
    let
      unstable = import nixpkgs-unstable {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations.pc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./domains/pc-hardware.nix
          ./domains/pc-specific.nix
          ./configuration.nix
          ./packages.nix
        ];

        specialArgs = {
          inherit unstable;
        };
      };

      nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./domains/laptop-specific.nix
          ./configuration.nix
          ./packages.nix
        ];

        specialArgs = {
          inherit unstable;
        };
      };
    };
}
