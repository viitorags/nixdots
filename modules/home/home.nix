{
  pkgs,
  unstable,
  ...
}:
{
  imports = [
    ./programs
  ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "vitor";
    homeDirectory = "/home/vitor";
    stateVersion = "25.05";
    packages = with pkgs; [
      xfce.thunar
      gnome.gvfs
      xfce.tumbler
      kitty.terminfo
      bc
      ibus
      imagemagick
      ueberzug
      unstable.pokemon-colorscripts
      gowall
    ];

    sessionVariables = {
      GTK_IM_MODULE = "ibus";
      TERMINAL = "wezterm";
    };

    file."Pictures/Wallpapers/".source = ../../assets/wallpapers;
    file.".face".source = ../../assets/profile.jpg;
  };

  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
