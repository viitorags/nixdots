{
  config,
  pkgs,
  ...
}:
{
  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-medium.yaml";

    targets = {
      gtk.enable = true;
      gtk.flatpakSupport.enable = true;
      qt.enable = true;
      vscode.enable = false;
    };

    fonts = {
      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;
      emoji = config.stylix.fonts.monospace;
      monospace = {
        name = "Maple Mono NF";
      };
    };

    cursor = {
      name = "Cursor";
      package = pkgs.callPackage ../../../../pkgs/cursor/package.nix { };
      size = 24;
    };

  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-nord;
    };
    gtk3.bookmarks = [
      "file://${config.home.homeDirectory}/Documents"
      "file://${config.home.homeDirectory}/Downloads"
      "file://${config.home.homeDirectory}/Pictures"
      "file://${config.home.homeDirectory}/Videos"
      "file://${config.home.homeDirectory}/Music"
      "file://${config.home.homeDirectory}/Workspace"
      "file://${config.home.homeDirectory}/nixdots"
    ];
  };

  qt.enable = true;

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  xdg.configFile."gtk-3.0/settings.ini".text = ''
    gtk-application-prefer-dark-theme=true
  '';

  xdg.configFile."gtk-4.0/settings.ini".text = ''
    gtk-application-prefer-dark-theme=true
  '';
}
