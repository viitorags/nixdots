{
  programs.zathura = {
    enable = true;

    options = {
      window-title-basename = true;
      statusbar-h-padding = 0;
      statusbar-v-padding = 0;
      page-padding = 3;

      scroll-half-up = "u";
      scroll-half-down = "d";
      toggle_page_mode = "D";
      reload = "r";
      rotate = "R";
      zoom-in = "K";
      zoom-out = "J";
      print = "p";
      # recolor = true;
      recolor-keephue = true;
      render-loading = true;

      # notification-error-bg = "rgba(31,31,40,1)"; # bg
      # notification-error-fg = "rgba(195,64,67,1)"; # red
      # notification-warning-bg = "rgba(31,31,40,1)"; # bg
      # notification-warning-fg = "rgba(192,163,110,1)"; # yellow
      # notification-bg = "rgba(31,31,40,1)"; # bg
      # notification-fg = "rgba(118,148,106,1)"; # green
      #
      # completion-bg = "rgba(50,53,63,1)"; # bg2
      # completion-fg = "rgba(220,215,186,1)"; # fg
      # completion-group-bg = "rgba(39,40,51,1)"; # bg-alt
      # completion-group-fg = "rgba(114,113,105,1)"; # grey
      # completion-highlight-bg = "rgba(126,156,216,1)"; # blue
      # completion-highlight-fg = "rgba(50,53,63,1)"; # bg2
      #
      # index-bg = "rgba(50,53,63,1)"; # bg2
      # index-fg = "rgba(220,215,186,1)"; # fg
      # index-active-bg = "rgba(126,156,216,1)"; # blue
      # index-active-fg = "rgba(50,53,63,1)"; # bg2
      #
      # inputbar-bg = "rgba(31,31,40,1)"; # bg
      # inputbar-fg = "rgba(220,215,186,1)"; # fg
      #
      # statusbar-bg = "rgba(50,53,63,1)"; # bg2
      # statusbar-fg = "rgba(220,215,186,1)"; # fg
      #
      # highlight-color = "rgba(192,163,110,0.5)"; # yellow
      # highlight-active-color = "rgba(255,160,102,0.5)"; # orange
      #
      # default-bg = "rgba(31,31,40,1)"; # bg
      # default-fg = "rgba(220,215,186,1)"; # fg
      # render-loading-bg = "rgba(31,31,40,1)"; # bg
      # render-loading-fg = "rgba(220,215,186,1)"; # fg
      #
      # recolor-lightcolor = "rgba(31,31,40,1)"; # bg
      # recolor-darkcolor = "rgba(220,215,186,1)"; # fg
    };
  };
}
