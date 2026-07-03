{
  description = "Vytorags NixOs Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    mynvim.url = "github:vytorags/nvim_dots";

    stylix.url = "github:nix-community/stylix/release-26.05";

    niri-flake = {
      url = "github:epireyn/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.6.0";

    niri.url = "github:YaLTeR/niri";

    mangowm = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    inir = {
      url = "github:snowarch/iNiR";
    };

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs-unstable";
        home-manager.follows = "home-manager";
      };
    };

    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    piri = {
      url = "github:Asthestarsfalll/piri";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixpkgs-unstable,
      mynvim,
      noctalia,
      nur,
      agenix,
      ...
    }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      vars = import ./vars;

      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          (final: prev: {
            bun = final.callPackage ./pkgs/bun/package.nix { };
          })
        ];
      };

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          (final: prev: {
            bun = final.callPackage ./pkgs/bun/package.nix { };
          })
        ];
      };

      dev = import ./dev {
        inherit
          pkgs
          unstable
          mynvim
          ;
      };
    in
    {
      nixosConfigurations = {
        kaizen = lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit
              inputs
              unstable
              mynvim
              vars
              ;
          };
          modules = [
            ./modules/configuration.nix
            nur.modules.nixos.default
            inputs.stylix.nixosModules.stylix
            inputs.nix-flatpak.nixosModules.nix-flatpak
            inputs.mangowm.nixosModules.mango
            inputs.agenix.nixosModules.default
            inputs.dms.nixosModules.dank-material-shell
            inputs.silentSDDM.nixosModules.default
            inputs.piri.nixosModules.default
            home-manager.nixosModules.home-manager
            {
              stylix = {
                polarity = "dark";
                base16Scheme = {
                  base00 = "#1e222a";
                  base01 = "#353b45";
                  base02 = "#3e4451";
                  base03 = "#545862";
                  base04 = "#565c64";
                  base05 = "#abb2bf";
                  base06 = "#b6bdca";
                  base07 = "#c8ccd4";
                  base08 = "#e06c75";
                  base09 = "#d19a66";
                  base0A = "#e5c07b";
                  base0B = "#98c379";
                  base0C = "#56b6c2";
                  base0D = "#61afef";
                  base0E = "#c678dd";
                  base0F = "#be5046";
                };

                fonts = {
                  monospace = {
                    name = "JetBrainsMono NF";
                  };
                };
                cursor = {
                  name = "Vimix-cursors";
                  package = pkgs.vimix-cursors;
                  size = 32;
                };
              };

              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit
                  inputs
                  unstable
                  mynvim
                  noctalia
                  vars
                  ;
                role = "desktop";
                isDesktop = true;
                hostName = "kaizen";
              };
              home-manager.users.${vars.username} = {
                imports = [
                  ./home/home.nix
                  inputs.niri-flake.homeModules.niri
                  inputs.stylix.homeModules.stylix
                  noctalia.homeModules.default
                  inputs.dms.homeModules.dank-material-shell
                  inputs.mangowm.hmModules.mango
                ];
                home.packages = dev.extraPackages;
              };
            }
          ];
        };
      };

      devShells."${system}" = dev.devShells;
    };
}
