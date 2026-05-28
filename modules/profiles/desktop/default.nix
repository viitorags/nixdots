{
  pkgs,
  unstable,
  ...
}:
{
  imports = [
    # ../../core/sddm.nix
    ../../core/dms-greeter.nix
    ../../core/niri.nix
    ../../core/portals.nix
    ../../core/bluetooth.nix
    ../../core/pipewire.nix
    ../../core/waydroid.nix
    ../../core/virt-manager.nix
    ../../core/opentablet.nix
    ../../core/gamemode.nix
    ../../core/flatpak.nix
    ../../core/docker.nix
    ../../core/steam.nix
  ];

  environment.systemPackages = with pkgs; [
    telegram-desktop
    kdePackages.ark
    (unstable.brave.override {
      commandLineArgs = [
        "--password-store=gnome"
        "--ozone-platform-hint=auto"
        "--enable-features=UseOzonePlatform,VaapiVideoDecoder,VaapiVideoEncoder,CanvasOopRasterization,BatterySaverModeAvailable,HighEfficiencyModeAvailable"
        "--disable-gpu-memory-buffer-video-frames"
        "--js-flags=--max-old-space-size=512"
      ];
    })
    gparted
    mpv
    freerdp
    grim
    slurp
    xwayland-satellite
    wl-clipboard
    wtype
    cliphist
    pamixer
    pavucontrol
    unstable.libsForQt5.qtstyleplugins
    unstable.libsForQt5.qt5ct
    unstable.libsForQt5.qt5.qtgraphicaleffects
    kdePackages.qt5compat
    unstable.kdePackages.qt6ct
    unstable.kdePackages.qtmultimedia
    unstable.kdePackages.qtstyleplugin-kvantum
    libei
    obsidian
    cowsay
    cmatrix
  ];

  services.tailscale.enable = true;
}
