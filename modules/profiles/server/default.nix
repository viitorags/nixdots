{
  pkgs,
  unstable,
  ...
}:
{
  imports = [
    ../../core/xfce.nix
    ../../core/portals.nix
    ../../core/pipewire.nix
  ];

  environment.systemPackages = with pkgs; [
    wl-clipboard
    wtype
    cliphist
  ];

  services.tailscale.enable = true;
}
