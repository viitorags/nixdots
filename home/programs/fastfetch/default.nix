{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        "source" = "/home/vitor/.config/fastfetch/images/image.png";
        type = "iterm";
        height = 4;
        # width = 26;
        padding = {
          right = 4;
        };
      };
      "display" = {
        "separator" = " ";
      };
      "modules" = [
        {
          "type" = "title";
          "keyWidth" = 10;
        }
        "break"
        {
          "type" = "os";
          "key" = " ";
          "keyColor" = "33";
        }
        {
          "type" = "kernel";
          "key" = " ";
          "keyColor" = "33";
        }
        {
          "type" = "packages";
          "key" = " ";
          "keyColor" = "33";
        }
        {
          "type" = "shell";
          "key" = " ";
          "keyColor" = "33";
        }
        {
          "type" = "terminal";
          "key" = " ";
          "keyColor" = "33";
        }
        {
          "type" = "wm";
          "key" = " ";
          "keyColor" = "33";
        }
        {
          "type" = "uptime";
          "key" = " ";
          "keyColor" = "33";
        }
        {
          "type" = "media";
          "key" = "󰝚 ";
          "keyColor" = "33";
        }
        "break"
        "break"
      ];
    };
  };
}
