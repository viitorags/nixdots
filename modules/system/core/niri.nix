{ inputs, pkgs, ... }:
{
  programs.niri = {
    enable = true;
    package = inputs.niri-blurry.packages.${pkgs.system}.niri;
  };
}
