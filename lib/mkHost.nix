# Helper function to create a NixOS host configuration
# This encapsulates the common host creation logic
{
  nixpkgs,
  home-manager,
  inputs,
  nur,
  sharedHomeManager,
  unstable,
  pkgs,
  vars,
}:
name:
let
  metaPath = ../hosts/${name}/meta.nix;
  meta = if builtins.pathExists metaPath then import metaPath else { };
  role = meta.role or "desktop";
  isDesktop = meta.isDesktop or (role == "desktop");
  hostName = meta.hostName or name;
  system = "x86_64-linux";
in
nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = {
    inherit
      inputs
      unstable
      role
      isDesktop
      hostName
      vars
      ;
  };
  modules = [
    ../hosts/${name}
    nur.modules.nixos.default
    inputs.stylix.nixosModules.stylix
  ]
  ++ nixpkgs.lib.optionals isDesktop [
    {
      stylix = {
        polarity = "dark";
        base16Scheme = {
          "base00" = "282828";
          "base01" = "3c3836";
          "base02" = "504945";
          "base03" = "665c54";
          "base04" = "928374";
          "base05" = "ebdbb2";
          "base06" = "fbf1c7";
          "base07" = "f9f5d7";
          "base08" = "cc241d";
          "base09" = "d65d0e";
          "base0A" = "d79921";
          "base0B" = "98971a";
          "base0C" = "689d6a";
          "base0D" = "458588";
          "base0E" = "b16286";
          "base0F" = "9d0006";
        };

        fonts = {
          monospace = {
            name = "VictorMono Nerd Font";
          };
        };
        cursor = {
          name = "Vimix-cursors";
          package = pkgs.vimix-cursors;
          size = 32;
        };
      };
    }
  ]
  ++ [
    inputs.nix-flatpak.nixosModules.nix-flatpak
    inputs.mangowm.nixosModules.mango
    inputs.agenix.nixosModules.default
    inputs.dms.nixosModules.dank-material-shell
  ]
  ++ [
    home-manager.nixosModules.home-manager
    (sharedHomeManager {
      inherit role hostName isDesktop;
    })
  ]
  ++ nixpkgs.lib.optionals isDesktop [
  ]
  ++ nixpkgs.lib.optional (builtins.pathExists ../modules/profiles/${role}.nix) ../modules/profiles/${role}.nix
  ++ nixpkgs.lib.optional (builtins.pathExists ../modules/profiles/${role}/default.nix) ../modules/profiles/${role};
}
