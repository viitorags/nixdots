{ pkgs, ... }:
{
  services.xserver = {
    enable = true;

    xkb = {
      layout = "br";
      variant = "";
    };

    excludePackages = [ pkgs.xterm ];

    videoDrivers = [ "modesetting" ];

    deviceSection = ''
      Option "AccelMethod" "none"
    '';
  };
}
