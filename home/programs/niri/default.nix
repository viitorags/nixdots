{
  config,
  pkgs,
  unstable,
  ...
}:
{
  imports = [
    ./binds.nix
    ./rules.nix
    ./animations.nix
  ];

  programs.niri = {
    enable = true;
    package = unstable.niri;

    settings = with config.lib.stylix.colors; {
      outputs."HDMI-A-1" = {
        mode = {
          width = 1440;
          height = 900;
          refresh = 74.997;
        };
        scale = 1;
        position = {
          x = 0;
          y = 0;
        };
      };

      input = {
        keyboard = {
          xkb = {
            layout = "br";
          };
          numlock = false;
        };

        touchpad.enable = false;

        mouse.enable = true;

        trackpoint.enable = false;
      };

      cursor.hide-when-typing = true;

      prefer-no-csd = true;

      layout = {
        gaps = 4;

        center-focused-column = "never";

        # preset-column-widths ={
        #   proportion 0.33333
        #     proportion 0.5
        #     proportion 0.66667
        # };

        default-column-width = {
          proportion = 0.5;
        };

        focus-ring.enable = false;

        border = {
          enable = true;
          width = 2;
          active.color = "#${base0D}";
          inactive.color = "#505050";
          # urgent = "#9b0000";
        };

        shadow = {
          softness = 20;

          spread = 5;

          offset = {
            x = 0;
            y = 5;
          };

          color = "#0007";
        };

        # struts = {
        #   left = 6;
        #   right = 6;
        #   top = 6;
        #   bottom = 6;
        # };
      };

      blur = {
        passes = 3;
        offset = 2;
      };

      hotkey-overlay.skip-at-startup = true;

      environment = {
        DISPLAY = ":0";
        QS_ICON_THEME = "${config.gtk.iconTheme.name}";
        QT_QPA_PLATFORMTHEME = "qt5ct";
        SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh";
        XDG_CURRENT_DESKTOP = "niri";
        XDG_SESSION_DESKTOP = "niri";
      };

      spawn-at-startup = [
        { argv = [ "dbus-update-activation-environment --systemd --all" ]; }
        { argv = [ "eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)" ]; }
        { argv = [ "xwayland-satellite" ]; }
        { argv = [ "wl-paste --type text --watch cliphist store" ]; }
        { argv = [ "wl-paste --type image --watch cliphist store" ]; }
        { sh = "noctalia --daemon"; }
      ];

      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

      overview = {
        zoom = 0.5;
      };

      gestures.hot-corners.enable = false;
    };
  };
}
