{
  pkgs,
  unstable,
  mynvim,
  ...
}:
{
  extraPackages = with pkgs; [
    mynvim.packages.${stdenv.hostPlatform.system}.nvim
    fd
    jq
    ripgrep
    shellcheck
    gnumake
    lazygit
    claude-code
    nodejs
    dbeaver-bin
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
    openssl
    python3
    android-tools
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
