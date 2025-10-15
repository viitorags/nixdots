{
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases =
      let
        flakeDir = "~/nixdots";
      in
      {
        rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
        upd = "nix flake update ${flakeDir}";
        upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";
        hms = "home-manager switch --flake ${flakeDir}";
        conf = "nvim ${flakeDir}/nixos/configuration.nix";
        pkgs = "nvim ${flakeDir}/nixos/modules/packages.nix";
        ls = "eza -ha --icons=auto --sort=name --group-directories-first";
        ll = "eza -lh --icons=auto";
        ff = "fastfetch";
        clear = "clear && printf $'\\033c'";
      };

    initContent = ''
      export PATH="$HOME/.cache/npm/global/bin:$PATH"
      export PATH="$HOME/.nix-profile/bin:$PATH"
      export QS_ICON_THEME="Papirus-Dark"
    '';

    oh-my-zsh = {
      enable = true;
      theme = "kphoen";
    };
  };
}
