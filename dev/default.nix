{
  pkgs,
  unstable,
  mynvim,
  lib,
  ...
}:
{
  extraPackages = with pkgs; [
    mynvim.packages.${stdenv.hostPlatform.system}.neovim
    fd
    jq
    rustlings
    ripgrep
    shellcheck
    gnumake
    lazygit
    claude-code
    codex
    libwebp
    persepolis
    aria2
    telegram-bot-api
    p7zip
    payload-dumper-go
    rtk
    nodejs
    dbeaver-bin
    flyctl
    # flutter
    godot-mono
    vscode-fhs
    (callPackage ../pkgs/bun/package.nix { })
    (callPackage ../pkgs/opencode/package.nix { })
    unstable.antigravity-cli
    insomnia
    delta
    lazydocker
    prettier
    pnpm
    (callPackage ../pkgs/php-cs-fixer/package.nix { })
    (callPackage ../pkgs/laravel-pint/package.nix { })
    php
    php.packages.composer
    laravel
    clang-tools
    gcc
    stdenv.cc
    clang-tools
    cmake
    pkg-config
    gnumake
    openjdk25
    go
    cargo
    rustc
    pkg-config
    clippy
    openssl.dev
    python3
    android-tools
    gum
    wrapGAppsHook4
    cargo-tauri
    librsvg.dev
    webkitgtk_4_1.dev
    glib.dev
  ];

  devShells = {
    qml = pkgs.mkShellNoCC {
      buildInputs = with pkgs; [
        quickshell
        alejandra
        statix
        deadnix
        shfmt
        shellcheck
        jsonfmt
        lefthook
        kdePackages.qtdeclarative
      ];
    };
  };
}
