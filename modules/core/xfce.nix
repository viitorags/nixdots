{ pkgs, vars, ... }:
{
  services.xserver = {
    enable = true;
    displayManager.lightdm = {
      enable = true;
      autoLogin = {
        enable = true;
        user = vars.username;
      };
    };
    desktopManager.xfce.enable = true;
  };

  # Optional: Disable XFCE's screen locker for server use
  environment.systemPackages = with pkgs; [
    xfce.xfce4-pulseaudio-plugin
    xfce.xfce4-whiskermenu-plugin
  ];
}
