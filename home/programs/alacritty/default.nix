{ config, inputs, ... }:
{
  programs.alacritty = {
    enable = true;

    settings = {
      env = {
        TERM = "xterm-256color";
      };

      window = {
        decorations = "none";
        dynamic_padding = true;
        opacity = 1.0;
        startup_mode = "Windowed";

        padding = {
          x = 1;
          y = 0;
        };
      };

      font = {
        size = 15;
        normal = {
          family = "VictorMono Nerd Font";
          style = "Bold";
        };

        bold = {
          family = "VictorMono Nerd Font";
          style = "Bold";
        };

        italic = {
          family = "VictorMono Nerd Font";
          style = "Italic";
        };

        bold_italic = {
          family = "VictorMono Nerd Font";
          style = "Bold Italic";
        };
      };

      cursor = {
        blink_interval = 500;
        unfocused_hollow = false;
      };

      mouse = {
        hide_when_typing = true;
      };

      selection = {
        save_to_clipboard = true;
      };

      keyboard.bindings = [
        {
          key = "N";
          mods = "Super";
          action = "SpawnNewInstance";
        }

        {
          key = "F";
          mods = "Control|Shift";
          action = "SearchForward";
        }

        {
          key = "Equals";
          mods = "Control";
          action = "IncreaseFontSize";
        }

        {
          key = "Minus";
          mods = "Control";
          action = "DecreaseFontSize";
        }

        {
          key = "Key0";
          mods = "Control";
          action = "ResetFontSize";
        }
      ];

      colors = with config.lib.stylix.colors.withHashtag; {
        primary = {
          foreground = base05;
          background = base00;
          bright_foreground = base07;
        };
        selection = {
          text = base05;
          background = base02;
        };
        cursor = {
          text = base00;
          cursor = base05;
        };
        normal = {
          black = base00;
          white = base05;
          inherit
            red
            green
            yellow
            blue
            magenta
            cyan
            ;
        };
        bright = {
          black = base03;
          white = base07;
          red = bright-red;
          green = bright-green;
          yellow = bright-yellow;
          blue = bright-blue;
          magenta = bright-magenta;
          cyan = bright-cyan;
        };
      };
    };
  };
}
