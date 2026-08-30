{ ... }:
{
  imports = [
    ./pipewire.nix
    ./bluetooth.nix
    ./sddm.nix
    ./niri.nix
    ./mango.nix
    # ./thermald.nix # no thermal profile for Sandy Bridge, dead weight
    ./opentablet.nix
    ./gamemode.nix
    # ./dms-greeter.nix
  ];
}
