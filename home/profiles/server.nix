{
  config,
  pkgs,
  ...
}:
{
  imports = [
    # ../programs/kitty
  ];

  # Minimal server-specific home-manager config
  home.sessionVariables = {
    # Any server-specific env vars
  };

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
    };
  };
}
