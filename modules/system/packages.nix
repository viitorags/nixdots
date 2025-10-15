{ pkgs, unstable, ... }:
{
  environment.systemPackages = with pkgs; [
    # Desktop apps
    telegram-desktop
    obsidian
    discord
    firefox
    kdePackages.ark
    (brave.override {
      commandLineArgs = [
        "--password-store=gnome"
      ];
    })
    gparted
    mpv
    exfatprogs
    upower

    # CLI utils
    tree
    wget
    git
    unzip
    ffmpeg
    zip
    brightnessctl
    nixos-shell
    docker-compose
    qemu
    avahi

    # Notifications
    libnotify

    # WM and Wayland stuff
    wayland
    xwayland
    xwayland-satellite
    wl-clipboard
    cliphist
    zsh
    eza
    xdg-user-dirs
    xdg-utils
    polkit_gnome
    libsecret
    gnome-keyring

    # Sound
    pipewire
    pulseaudio
    pamixer
    pavucontrol

    # Other
    home-manager
    libsForQt5.qt5.qtsvg
    libsForQt5.qtstyleplugins
    libsForQt5.qt5ct
    libsForQt5.qtgraphicaleffects
    kdePackages.qt6ct
    # kdePackages.kirigami
    # kdePackages.kirigami-addons
    kdePackages.qtstyleplugin-kvantum
    cowsay
    cmatrix
  ];

  # Fonts
  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.jetbrains-mono
    sarasa-gothic
  ];
}
