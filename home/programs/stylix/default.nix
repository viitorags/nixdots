{
  config,
  pkgs,
  isDesktop,
  ...
}:
let
  font = config.stylix.fonts.monospace;
in
{
  stylix = {
    enable = true;
    polarity = "dark";

    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

    # base16Scheme = {
    #   base00 = "#1e222a";
    #   base01 = "#353b45";
    #   base02 = "#3e4451";
    #   base03 = "#545862";
    #   base04 = "#565c64";
    #   base05 = "#abb2bf";
    #   base06 = "#b6bdca";
    #   base07 = "#c8ccd4";
    #   base08 = "#e06c75";
    #   base09 = "#d19a66";
    #   base0A = "#e5c07b";
    #   base0B = "#98c379";
    #   base0C = "#56b6c2";
    #   base0D = "#61afef";
    #   base0E = "#c678dd";
    #   base0F = "#be5046";
    # };

    # base16Scheme = {
    #   base00 = "#0f0f0f";
    #   base01 = "#191919";
    #   base02 = "#262626";
    #   base03 = "#393939";
    #   base04 = "#4c4c4c";
    #   base05 = "#cacaca";
    #   base06 = "#e7e7e7";
    #   base07 = "#f0f0f0";
    #   base08 = "#ac8a8c";
    #   base09 = "#ceb188";
    #   base0A = "#aca98a";
    #   base0B = "#8aac8b";
    #   base0C = "#8aabac";
    #   base0D = "#8f8aac";
    #   base0E = "#ac8aac";
    #   base0F = "#ac8a8c";
    # };

    targets = {
      gtk.enable = true;
      gtk.flatpakSupport.enable = isDesktop;
      qt.enable = true;
      vscode.enable = false;
      cava.enable = false;
      noctalia-shell.enable = false;
      starship.enable = false;
      alacritty.enable = false;
      zen-browser = {
        enable = true;
        profileNames = [ "default" ];
      };
      dank-material-shell.enable = false;
      sioyek.enable = false;
      # gnome.enable = false;
    };

    fonts = {
      serif = font;
      sansSerif = font;
      emoji = font;
      monospace = {
        # name = "Gintronic";
        name = "DankMono Nerd Font";
      };
    };

    cursor = {
      name = "Vimix-cursors";
      package = pkgs.vimix-cursors;
      size = 32;
    };
  };

  # dconf.settings = {
  #   "org/gnome/desktop/interface" = {
  #     color-scheme = "prefer-dark";
  #   };
  # };
  #
  # xdg.configFile."gtk-3.0/settings.ini".text = ''
  #   gtk-application-prefer-dark-theme=true
  # '';
  #
  # xdg.configFile."gtk-4.0/settings.ini".text = ''
  #   gtk-application-prefer-dark-theme=true
  # '';
}
