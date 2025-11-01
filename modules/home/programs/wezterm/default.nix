{ unstable, ... }:
{
  programs.wezterm = {
    enable = true;
    package = unstable.wezterm;
    enableZshIntegration = true;

    extraConfig = ''
      local config = wezterm.config_builder()

      config.enable_wayland = true
      config.enable_tab_bar = false
      config.window_close_confirmation = "NeverPrompt"
      config.font = wezterm.font({
          family = "MonaspiceRn Nerd Font",
          harfbuzz_features = { "calt", "liga", "dlig", "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08" },
          weight = "DemiBold",
          italic = false,
      })
      config.font_rules = {
          {
              intensity = "Half",
              italic = false,
              font = wezterm.font("MonaspiceRn Nerd Font", { weight = "Bold", stretch = "Normal" }),
          },
          {
              intensity = "Half",
              italic = true,
              font = wezterm.font("MonaspiceRn Nerd Font", { weight = "Bold", stretch = "Normal", style = "Italic" }),
          },
      }
      config.font_size = 12
      config.custom_block_glyphs = false
      config.mouse_wheel_scrolls_tabs = false
      config.warn_about_missing_glyphs = false
      config.window_padding = {
          left = 3,
          right = 1,
          top = 5,
          bottom = 0,
      }
      config.keys = {
          {
              key = "h",
              mods = "ALT|SHIFT",
              action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
          },
          {
              key = "v",
              mods = "ALT|SHIFT",
              action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
          },
          {
              key = "c",
              mods = "ALT|SHIFT",
              action = wezterm.action.SplitPane({
                direction = "Left",
                command = { args = { "copilot" } },
              }),
          },
          {
              key = "h",
              mods = "ALT",
              action = wezterm.action.ActivatePaneDirection("Left"),
          },
          {
              key = "l",
              mods = "ALT",
              action = wezterm.action.ActivatePaneDirection("Right"),
          },
          {
              key = "k",
              mods = "ALT",
              action = wezterm.action.ActivatePaneDirection("Up"),
          },
          {
              key = "j",
              mods = "ALT",
              action = wezterm.action.ActivatePaneDirection("Down"),
          },
          {
              key = "h",
              mods = "CTRL|ALT",
              action = wezterm.action.AdjustPaneSize({ "Left", 3 }),
          },
          {
              key = "l",
              mods = "CTRL|ALT",
              action = wezterm.action.AdjustPaneSize({ "Right", 3 }),
          },
          {
              key = "k",
              mods = "CTRL|ALT",
              action = wezterm.action.AdjustPaneSize({ "Up", 3 }),
          },
          {
              key = "j",
              mods = "CTRL|ALT",
              action = wezterm.action.AdjustPaneSize({ "Down", 3 }),
          },
          {
              key = "w",
              mods = "ALT|SHIFT",
              action = wezterm.action.CloseCurrentPane({ confirm = false }),
          },
      }

      -- config.unix_domains = {
      --     { name = "unix" },
      -- }

      return config

    '';
  };
}
