{
  config,
  ...
}:
{
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "Mod+Shift+Slash".action = show-hotkey-overlay;

    "Mod+Return".action = spawn [
      "wezterm"
    ];
    "Mod+Shift+Return".action = spawn-sh [
      "piri scratchpads term toggle"
    ];
    "Mod+A".action = spawn [
      "noctalia"
      "msg"
      "panel-toggle"
      "launcher"
    ];
    "Mod+V".action = spawn [
      "noctalia"
      "msg"
      "panel-toggle"
      "clipboard"
    ];
    "Mod+W".action = spawn [
      "noctalia"
      "msg"
      "panel-toggle"
      "wallpaper"
    ];
    "Mod+P".action = spawn [
      "noctalia"
      "msg"
      "panel-toggle"
      "session"
    ];
    "Mod+C".action = spawn [
      "wezterm"
      "-e"
      "zsh"
      "-ic"
      "nvim"
    ];
    "Mod+E".action = spawn [
      "wezterm"
      "start"
      "--"
      "yazi"
    ];
    "Mod+B".action = spawn [ "zen-beta" ];
    "Mod+Shift+T".action = spawn-sh [ "piri sticky add" ];
    "Mod+F".action = maximize-column;
    "Mod+R".action = switch-preset-column-width;
    "Mod+T".action = toggle-window-floating;
    "Super+Alt+L".action = spawn [ "swaylock" ];
    "XF86AudioRaiseVolume".action = spawn [
      "wpctl"
      "set-volume"
      "@DEFAULT_AUDIO_SINK@"
      "0.1+"
    ];
    "XF86AudioRaiseVolume".allow-when-locked = true;
    "XF86AudioLowerVolume".action = spawn [
      "wpctl"
      "set-volume"
      "@DEFAULT_AUDIO_SINK@"
      "0.1-"
    ];
    "XF86AudioLowerVolume".allow-when-locked = true;
    "XF86AudioMute".action = spawn [
      "wpctl"
      "set-mute"
      "@DEFAULT_AUDIO_SINK@"
      "toggle"
    ];
    "XF86AudioMute".allow-when-locked = true;
    "XF86AudioMicMute".action = spawn [
      "wpctl"
      "set-mute"
      "@DEFAULT_AUDIO_SOURCE@"
      "toggle"
    ];
    "XF86AudioMicMute".allow-when-locked = true;

    "Mod+O".action = toggle-overview;
    "Mod+O".repeat = false;

    "Mod+Q".action = close-window;

    "Mod+Left".action = focus-column-left;
    "Mod+Right".action = focus-column-right;
    "Mod+Up".action = focus-window-up;
    "Mod+Down".action = focus-window-down;
    "Mod+H".action = focus-column-left;
    "Mod+J".action = focus-window-down;
    "Mod+K".action = focus-window-up;
    "Mod+L".action = focus-column-right;

    "Mod+Ctrl+Left".action = move-column-left;
    "Mod+Ctrl+Right".action = move-column-right;
    "Mod+Ctrl+Up".action = move-window-up;
    "Mod+Ctrl+Down".action = move-window-down;
    "Mod+Ctrl+H".action = move-column-left;
    "Mod+Ctrl+J".action = move-window-down;
    "Mod+Ctrl+K".action = move-window-up;
    "Mod+Ctrl+L".action = move-column-right;

    "Mod+Home".action = focus-column-first;
    "Mod+End".action = focus-column-last;
    "Mod+Ctrl+Home".action = move-column-to-first;
    "Mod+Ctrl+End".action = move-column-to-last;

    "Mod+Shift+Left".action = focus-monitor-left;
    "Mod+Shift+Right".action = focus-monitor-right;
    "Mod+Shift+Up".action = focus-monitor-up;
    "Mod+Shift+Down".action = focus-monitor-down;
    "Mod+Shift+H".action = focus-monitor-left;
    "Mod+Shift+J".action = focus-monitor-down;
    "Mod+Shift+K".action = focus-monitor-up;
    "Mod+Shift+L".action = focus-monitor-right;

    "Mod+Shift+Ctrl+Left".action = move-column-to-monitor-left;
    "Mod+Shift+Ctrl+Right".action = move-column-to-monitor-right;
    "Mod+Shift+Ctrl+Up".action = move-column-to-monitor-up;
    "Mod+Shift+Ctrl+Down".action = move-column-to-monitor-down;
    "Mod+Shift+Ctrl+H".action = move-column-to-monitor-left;
    "Mod+Shift+Ctrl+J".action = move-column-to-monitor-down;
    "Mod+Shift+Ctrl+K".action = move-column-to-monitor-up;
    "Mod+Shift+Ctrl+L".action = move-column-to-monitor-right;

    "Mod+Page_Down".action = focus-workspace-down;
    "Mod+Page_Up".action = focus-workspace-up;
    "Mod+U".action = focus-workspace-down;
    "Mod+I".action = focus-workspace-up;
    "Mod+Ctrl+Page_Down".action = move-column-to-workspace-down;
    "Mod+Ctrl+Page_Up".action = move-column-to-workspace-up;
    "Mod+Ctrl+U".action = move-column-to-workspace-down;
    "Mod+Ctrl+I".action = move-column-to-workspace-up;

    "Mod+Shift+Page_Down".action = move-workspace-down;
    "Mod+Shift+Page_Up".action = move-workspace-up;
    "Mod+Shift+U".action = move-workspace-down;
    "Mod+Shift+I".action = move-workspace-up;

    "Mod+WheelScrollDown".action = focus-workspace-down;
    "Mod+WheelScrollDown".cooldown-ms = 150;
    "Mod+WheelScrollUp".action = focus-workspace-up;
    "Mod+WheelScrollUp".cooldown-ms = 150;
    "Mod+Ctrl+WheelScrollDown".action = move-column-to-workspace-down;
    "Mod+Ctrl+WheelScrollDown".cooldown-ms = 150;
    "Mod+Ctrl+WheelScrollUp".action = move-column-to-workspace-up;
    "Mod+Ctrl+WheelScrollUp".cooldown-ms = 150;

    "Mod+WheelScrollRight".action = focus-column-right;
    "Mod+WheelScrollLeft".action = focus-column-left;
    "Mod+Ctrl+WheelScrollRight".action = move-column-right;
    "Mod+Ctrl+WheelScrollLeft".action = move-column-left;

    "Mod+Shift+WheelScrollDown".action = focus-column-right;
    "Mod+Shift+WheelScrollUp".action = focus-column-left;
    "Mod+Ctrl+Shift+WheelScrollDown".action = move-column-right;
    "Mod+Ctrl+Shift+WheelScrollUp".action = move-column-left;

    # Workspaces
    "Mod+1".action.focus-workspace = 1;
    "Mod+2".action.focus-workspace = 2;
    "Mod+3".action.focus-workspace = 3;
    "Mod+4".action.focus-workspace = 4;
    "Mod+5".action.focus-workspace = 5;
    "Mod+6".action.focus-workspace = 6;
    "Mod+7".action.focus-workspace = 7;
    "Mod+8".action.focus-workspace = 8;
    "Mod+9".action.focus-workspace = 9;

    "Mod+Shift+1".action.move-column-to-workspace = 1;
    "Mod+Shift+2".action.move-column-to-workspace = 2;
    "Mod+Shift+3".action.move-column-to-workspace = 3;
    "Mod+Shift+4".action.move-column-to-workspace = 4;
    "Mod+Shift+5".action.move-column-to-workspace = 5;
    "Mod+Shift+6".action.move-column-to-workspace = 6;
    "Mod+Shift+7".action.move-column-to-workspace = 7;
    "Mod+Shift+8".action.move-column-to-workspace = 8;
    "Mod+Shift+9".action.move-column-to-workspace = 9;

    "Mod+BracketLeft".action = consume-or-expel-window-left;
    "Mod+BracketRight".action = consume-or-expel-window-right;

    "Mod+Comma".action = consume-window-into-column;
    "Mod+Period".action = expel-window-from-column;

    "Mod+Shift+R".action = switch-preset-window-height;
    "Mod+Ctrl+R".action = reset-window-height;
    "Mod+Shift+F".action = fullscreen-window;

    "Mod+Ctrl+F".action = expand-column-to-available-width;

    "Mod+Minus".action = set-column-width "-10%";
    "Mod+Equal".action = set-column-width "+10%";
    "Mod+Shift+Minus".action = set-window-height "-10%";
    "Mod+Shift+Equal".action = set-window-height "+10%";

    "Mod+Shift+V".action = switch-focus-between-floating-and-tiling;

    "Insert".action.screenshot = [ ];
    "Ctrl+Insert".action.screenshot-screen = {
      write-to-disk = true;
      show-pointer = false;
    };
    "Alt+Insert".action.screenshot-window = [ ];

    "Mod+Escape".action = toggle-keyboard-shortcuts-inhibit;
    "Mod+Escape".allow-inhibiting = false;

    "Mod+Shift+E".action = quit;
    "Ctrl+Alt+Delete".action = quit;

    "Mod+Shift+P".action = power-off-monitors;
  };
}
