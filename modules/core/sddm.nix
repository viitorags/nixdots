{
  pkgs,
  ...
}:
let
  mybg = "wallhaven-1kzqww.png";
in
{
  programs.silentSDDM = {
    enable = true;
    theme = "gruvbox";
    # backgrounds = {
    #   mybg = ../../assets/wallpapers/${mybg};
    # };
    # settings = {
    #   "LoginScreen" = {
    #     background = "${mybg}";
    #   };
    #   "LockScreen" = {
    #     background = "${mybg}";
    #   };
    # };
  };
  services = {
    displayManager = {
      enable = true;
      sddm = {
        enable = true;
        wayland.enable = true;
        package = pkgs.kdePackages.sddm;
      };
      defaultSession = "niri";
    };
  };
}
