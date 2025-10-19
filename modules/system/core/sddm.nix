{
  pkgs,
  ...
}:
let
  sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "japanese_aesthetic";
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
