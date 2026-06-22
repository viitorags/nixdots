{ lib, config, ... }:
let
  font = config.stylix.fonts.monospace;
in
{
  programs.foot = {
    enable = true;
    settings = {
      main = lib.mkForce {
        term = "xterm-256color";
        font = "${font.name}:style=Bold:size=13.9";
        font-bold = "${font.name}:style=Bold:size=13.9";
        font-italic = "${font.name}:style=Italic:size=13.9";
        font-bold-italic = "${font.name}:style=Bold Italic:size=13.9";
        pad = "2x0";
      };

      cursor = {
        blink = "yes";
        unfocused-style = "none";
      };

      mouse = {
        hide-when-typing = "yes";
      };

      key-bindings = {
        spawn-terminal = "Super+n";

        search-start = "Control+Shift+f";

        font-increase = "Control+equal";
        font-decrease = "Control+minus";
        font-reset = "Control+0";
      };
    };
  };
}
