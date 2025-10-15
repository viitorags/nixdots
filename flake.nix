{
  description = "Viitorags NixOs Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    mynvim.url = "github:viitorags/nvim";

    stylix = {
      url = "github:nix-community/stylix/release-25.05";
    };

    niri-flake = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    niri-blurry = {
      url = "github:visualglitch91/niri/feat/blur";
      flake = false;
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
      inputs.quickshell.follows = "quickshell";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixpkgs-unstable,
      mynvim,
      quickshell,
      noctalia,
      nur,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations.gh0stk = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./modules/system/configuration.nix
          inputs.niri-flake.nixosModules.niri
          nur.modules.nixos.default
          inputs.stylix.nixosModules.stylix
        ];
        specialArgs = {
          inherit unstable;
          inherit inputs;
        };
      };
      homeConfigurations.vitor = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        modules = [
          ./modules/home/home.nix
          inputs.niri-flake.homeModules.niri
          inputs.stylix.homeModules.stylix
        ];
        extraSpecialArgs = {
          inherit inputs;
          inherit unstable;
          inherit mynvim;
          inherit quickshell;
          inherit noctalia;
        };
      };
    };
}
