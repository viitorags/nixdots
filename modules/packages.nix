{
  pkgs,
  unstable,
  lib,
  mynvim,
  ...
}:
let
  corePackages = with pkgs; [
    tree
    wget
    git
    unzip
    zip
    zsh
    eza
    nixos-shell
    docker
    docker-compose
    iptables
  ];

  desktopPackages = with pkgs; [
    unrar
    ffmpeg
    brightnessctl
    qemu
    avahi
    home-manager
    upower
    exfatprogs
    yt-dlp
    dconf
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
    # unstable.qt5.qtstyleplugins
    libsForQt5.qt5ct
    unstable.qt5.qtgraphicaleffects
    kdePackages.qt5compat
    unstable.kdePackages.qt6ct
    unstable.kdePackages.qtmultimedia
    unstable.kdePackages.qtstyleplugin-kvantum
    libei
    obsidian
    cowsay
    cmatrix
  ];
in
{
  environment.systemPackages = corePackages ++ desktopPackages;

  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.victor-mono
    nerd-fonts.jetbrains-mono
    material-symbols
    (callPackage ../pkgs/sarasa-gothic-nf/package.nix { })
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    dejavu_fonts
  ];

  fonts.fontconfig.useEmbeddedBitmaps = false;
}
