{
  pkgs,
  ...
}:
let
  sddm-astronaut = pkgs.sddm-astronaut.override {
    # embeddedTheme = "pixel_sakura_static";
    embeddedTheme = "purple_leaves";
    # themeConfig = {
    # };
  };
in
{
  services = {
    displayManager = {
      enable = true;
      sddm = {
        enable = true;
        wayland.enable = true;
        package = pkgs.kdePackages.sddm;
        theme = "sddm-astronaut-theme";
        extraPackages = [ sddm-astronaut ];
      };
      defaultSession = "niri";
    };
  };

  environment.systemPackages = [ sddm-astronaut ];
}
