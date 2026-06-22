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
    # image = ../../../assets/wallpapers/ddg_1776503847400342859.jpg;
    polarity = "dark";

    # base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";

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
    #   base00 = "#1a1a2e";
    #   base01 = "#1e1e3f";
    #   base02 = "#2d2b55";
    #   base03 = "#4a3568";
    #   base04 = "#b3b3b3";
    #   base05 = "#ffffff";
    #   base06 = "#d9d9d9";
    #   base07 = "#f8f8ff";
    #   base08 = "#fe4450";
    #   base09 = "#ff9f1c";
    #   base0A = "#ffd000";
    #   base0B = "#72f1b8";
    #   base0C = "#03edf9";
    #   base0D = "#0097b2";
    #   base0E = "#c792ea";
    #   base0F = "#ff7edb";
    # };

    # base16Scheme = {
    #   base00 = "#1d2021";
    #   base01 = "#282828";
    #   base02 = "#3c3836";
    #   base03 = "#504945";
    #   base04 = "#bdae93";
    #   base05 = "#d5c4a1";
    #   base06 = "#ebdbb2";
    #   base07 = "#fbf1c7";
    #   base08 = "#d43847";
    #   base09 = "#b82c3b";
    #   base0A = "#e55f4f";
    #   base0B = "#c32d3a";
    #   base0C = "#dd434e";
    #   base0D = "#9f2231";
    #   base0E = "#c72f44";
    #   base0F = "#7c1a27";
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
        name = "JetBrainsMono NF";
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
