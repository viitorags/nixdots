{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./user.nix
    ./udisk.nix
    ./polkit.nix
    ./zram.nix
    ./accountservice.nix
    ./ccache.nix
    ./ananicy.nix
    ./scx.nix
    ./portals.nix
    ./xserver.nix
    ./aic8800dc.nix
  ];
}
