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
          ./pc-hardware.nix
          ./pc-specific.nix
          ./configuration.nix
          ./packages.nix

          (
            { pkgs, lib, ... }:
            {
              networking.hostName = "pr1nc3ofcats";
            }
          )
        ];

        specialArgs = {
          inherit unstable;
        };
      };
    };
}
