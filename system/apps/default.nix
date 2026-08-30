{ ... }:
{
  imports = [
    ./packages.nix
    ./docker.nix
    ./flatpak.nix
    # ./virt-manager.nix # unused, disabled to save RAM
    # ./steam.nix # unused, no GPU anyway
    # ./waydroid.nix # unused, disabled to save RAM
    # ./xfce.nix
  ];
}
