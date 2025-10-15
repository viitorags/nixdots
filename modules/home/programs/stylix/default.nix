{
  config,
  pkgs,
  ...
}:
{
  stylix = {
    enable = true;
    polarity = "dark";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
    base16Scheme = {
      base00 = "#190920";
      base01 = "#130815";
      base02 = "#2a1730";
      base03 = "#3b2460";
      base04 = "#9c88e7";
      base05 = "#eae2ff";
      base06 = "#f4eeff";
      base07 = "#fcfbff";
      base08 = "#ff1e34";
      base09 = "#f38e21";
      base0A = "#ffe756";
      base0B = "#49ffbe";
      base0C = "#49eaff";
      base0D = "#8cc1ff";
      base0E = "#9544f7";
      base0F = "#ffadff";
    };

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
        name = "Sarasa Mono CL SemiBold";
      };
    };

    cursor = {
      name = "Cursor";
      package = pkgs.callPackage ./cursor { };
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
