{ ... }:
{
  imports = [
    ./user.nix
    ./udisk.nix
    ./polkit.nix
    ./zram.nix
    ./accountservice.nix
    # ./thermald.nix # no thermal profile for Sandy Bridge, dead weight
    ./ccache.nix
    ./ananicy.nix
    ./scx.nix
    ./sddm.nix
    ./niri.nix
    ./portals.nix
    ./bluetooth.nix
    ./pipewire.nix
    # ./virt-manager.nix # unused, disabled to save RAM
    ./opentablet.nix
    ./gamemode.nix
    ./flatpak.nix
    ./docker.nix
    # ./steam.nix # unused, no GPU anyway
    # ./waydroid.nix # unused, disabled to save RAM
  ];
}
