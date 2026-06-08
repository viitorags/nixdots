{
  config,
  ...
}:
let
  homeDir = config.home.homeDirectory;
  font = config.stylix.fonts.monospace;
in
{
  imports = [
    ./dms.nix
  ];

  programs.noctalia = with config.lib.stylix.colors.withHashtag; {
    enable = true;

    settings = {
      theme = {
        mode = "dark";
        source = "custom";
        custom_palette = "Stylix";
      };

      bar.default = {
        position = "right";
        thickness = 42;
        margin_ends = 10;
        radius = 12;
        scale = 1.20;
        border = "secondary";
        border_width = 2.0;
        background_opacity = 0.80;
        capsule = true;
        capsule_opacity = 0.80;
        padding = 8;
        start = [ "workspaces" ];
        center = [
          "clock"
          "spacer_2"
        ];
        end = [
          "tray"
          "media"
          "ram"
          "screen_recorder"
          "notifications"
          "network"
          "bluetooth"
          "volume"
          "brightness"
          "control-center"
        ];
      };

      backdrop = {
        enabled = true;
      };

      wallpaper = {
        enabled = true;
        directory = "${homeDir}/dotfiles/assets/wallpapers";
      };

      shell = {
        font_family = "${font.name}";
        avatar_path = "${homeDir}/dotfiles/assets/profile.png";
      };

      shell.panel = {
        launcher_placement = "floating";
        clipboard_placement = "floating";
        control_center_placement = "floating";
        wallpaper_placement = "floating";
        session_placement = "floating";
        transparency_mode = "soft";
      };

      osd = {
        position = "top_left";
        scale = 1.0;
        background_opacity = 0.80;
      };

      location = {
        auto_locate = true;
      };

      widget.tray = {
        hidden = [ "blueman" ];
        drawer = true;
      };

      widget.control-center = {
        glyph = "cat";
        custom_image_colorize = true;
      };

      widget.ram = {
        show_label = false;
      };

      widget.network = {
        show_label = false;
      };

      widget.workspaces = {
        minimal = false;
        hide_when_empty = true;
      };
    };

    customPalettes = {
      Stylix = {
        dark = {
          mPrimary = "${base0B}";
          mOnPrimary = "${base00}";
          mSecondary = "${base0D}";
          mOnSecondary = "${base00}";
          mTertiary = "${base08}";
          mOnTertiary = "${base00}";
          mError = "${base08}";
          mOnError = "${base00}";
          mSurface = "${base00}";
          mOnSurface = "${base05}";
          mSurfaceVariant = "${base01}";
          mOnSurfaceVariant = "${base0B}";
          mOutline = "${base03}";
          mShadow = "${base00}";
          mHover = "${base01}";
          mOnHover = "${base05}";
          terminal = {
            background = "${base00}";
            foreground = "${base05}";
            cursor = "${base05}";
            cursorText = "${base00}";
            selectionBg = "${base05}";
            selectionFg = "${base00}";
            normal = {
              black = "${base00}";
              red = "${base08}";
              green = "${base0B}";
              yellow = "${base0A}";
              blue = "${base0D}";
              magenta = "${base0E}";
              cyan = "${base0C}";
              white = "${base05}";
            };
            bright = {
              black = "${base03}";
              red = "${base08}";
              green = "${base0B}";
              yellow = "${base0A}";
              blue = "${base0D}";
              magenta = "${base0E}";
              cyan = "${base0C}";
              white = "${base07}";
            };
          };
        };
        light = {
          mPrimary = "${base0B}";
          mOnPrimary = "${base07}";
          mSecondary = "${base0D}";
          mOnSecondary = "${base07}";
          mTertiary = "${base08}";
          mOnTertiary = "${base07}";
          mError = "${base08}";
          mOnError = "${base07}";
          mSurface = "${base07}";
          mOnSurface = "${base00}";
          mSurfaceVariant = "${base06}";
          mOnSurfaceVariant = "${base00}";
          mOutline = "${base0B}";
          mShadow = "${base06}";
          mHover = "${base06}";
          mOnHover = "${base00}";
          terminal = {
            background = "${base07}";
            foreground = "${base00}";
            cursor = "${base00}";
            cursorText = "${base07}";
            selectionBg = "${base00}";
            selectionFg = "${base07}";
            normal = {
              black = "${base07}";
              red = "${base08}";
              green = "${base0B}";
              yellow = "${base0A}";
              blue = "${base0D}";
              magenta = "${base0E}";
              cyan = "${base0C}";
              white = "${base00}";
            };
            bright = {
              black = "${base06}";
              red = "${base08}";
              green = "${base0B}";
              yellow = "${base0A}";
              blue = "${base0D}";
              magenta = "${base0E}";
              cyan = "${base0C}";
              white = "${base00}";
            };
          };
        };
      };
    };
  };
}
