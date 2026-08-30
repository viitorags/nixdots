{
  unstable,
  config,
  lib,
  ...
}:
let
  font = config.stylix.fonts.monospace;
in
{
  programs.kitty = {
    enable = true;
    package = unstable.kitty;
    shellIntegration.enableZshIntegration = true;

    font = lib.mkForce {
      name = "${font.name}";
      size = 14;
    };

    shellIntegration.mode = "no-cursor";

    settings = {
      text_composition_strategy = "legacy";
      bold_font = "${font.name} Bold";
      italic_font = "${font.name} Italic";
      bold_italic_font = "${font.name} Bold Italic";
      # font_features = "${font.name} +calt +liga +dlig +ss01 +ss02 +ss03 +ss04 +ss05 +ss06 +ss07 +ss08";
      font_features = "none";
      modify_font = "cell_width 110%";
      cursor_blink_interval = "0";
      cursor_stop_blinking_after = "0";
      cursor_trail = 3;
      cursor_trail_decay = "0.1 0.4";
      cursor_trail_start_threshold = 2;
      cursor_trail_color = "none";
      adjust_line_height = "120%";
      window_padding_width = "2 3 0 3";
      cursor_shape = "block";
      tab_bar_style = "powerline";
      tab_bar_edge = "top";
      confirm_os_window_close = "0";
      wayland_titlebar_color = "background";
    };

    keybindings = {
      "alt+t" = "new_tab_with_cwd";
      "alt+comma" = "set_tab_title";
      "alt+w" = "nth_window -1";
      "alt+n" = "next_tab";
      "alt+p" = "previous_tab";

      "alt+shift+h" = "launch --location=vsplit --cwd=current";
      "alt+shift+v" = "launch --location=hsplit --cwd=current";

      "alt+shift+w" = "close_window";

      "alt+h" = "neighboring_window left";
      "alt+l" = "neighboring_window right";
      "alt+k" = "neighboring_window up";
      "alt+j" = "neighboring_window down";

      "ctrl+alt+h" = "resize_window narrower 3";
      "ctrl+alt+l" = "resize_window wider 3";
      "ctrl+alt+k" = "resize_window taller 3";
      "ctrl+alt+j" = "resize_window shorter 3";

      "alt+f" = "toggle_layout stack";

      # "alt+shift+c" = "launch --location=vsplit --cwd=current sh -c 'sleep 2; gemini'";
      "super+n" = "launch --type=os-window --cwd=current";
    };
  };
}
