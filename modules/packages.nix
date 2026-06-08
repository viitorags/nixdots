{
  pkgs,
  unstable,
  lib,
  isDesktop,
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
  ];

  serverPackages = with pkgs; [
    cloudflared
    caddy
    nbfc-linux
    htop
  ];
in
{
  environment.systemPackages =
    corePackages
    ++ lib.optionals isDesktop desktopPackages
    ++ lib.optionals (!isDesktop) serverPackages;

  fonts.packages = lib.optionals isDesktop (
    with pkgs;
    [
      font-awesome
      nerd-fonts.victor-mono
      nerd-fonts.jetbrains-mono
      material-symbols
      (callPackage ../pkgs/sarasa-gothic-nf/package.nix { })
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      dejavu_fonts
    ]
  );

  fonts.fontconfig.useEmbeddedBitmaps = false;
}
