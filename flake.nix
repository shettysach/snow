{
  description = "NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    niri.url = "github:sodiboo/niri-flake";

    cohle.url = "github:shettysach/cohle";
    cohle.inputs.nixpkgs.follows = "nixpkgs";

    glimpse.url = "github:seatedro/glimpse";
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      ...
    }@inputs:

    let
      system = "x86_64-linux";
      user = "sword";
    in

    {
      # nixpkgs.overlays = [ inputs.niri.overlays.niri ];

      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs system;

          pkgs-stable = import nixpkgs-stable {
            inherit system;
            config.allowUnfree = true;
          };
        };

        modules = [
          ./nixos/configuration.nix
          inputs.stylix.nixosModules.stylix
          inputs.niri.nixosModules.niri
        ];

      };

      homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};

        modules = [
          ./home-manager/home.nix
          inputs.stylix.homeManagerModules.stylix
          inputs.niri.homeModules.niri
          inputs.niri.homeModules.stylix
        ];
      };
    };
}
