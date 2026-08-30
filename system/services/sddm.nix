{
  pkgs,
  lib,
  ...
}:
{
  programs.silentSDDM = {
    enable = true;
    theme = "gruvbox";
  };
  services = {
    displayManager = {
      enable = true;
      sddm = {
        enable = true;
        wayland.enable = lib.mkForce true;
        package = pkgs.kdePackages.sddm;
      };
      defaultSession = "niri";
    };
  };
}
