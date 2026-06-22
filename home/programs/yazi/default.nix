{ pkgs, unstable, ... }:
{
  home = {
    packages = with pkgs; [
      ouch
      glow
      ripdrag
    ];
  };

  programs.yazi = {
    enable = true;
    enableNushellIntegration = true;

    initLua = ./main.lua;

    keymap = {
      mgr.prepend_keymap = [
        {
          on = "M";
          run = "plugin mount";
        }
        {
          on = "L";
          run = "lazygit";
        }
        {
          on = [
            "P"
            "p"
          ];
          run = "plugin diff";
          desc = "Diff the selected with the hovered file";
        }
        {
          on = [ "C" ];
          run = "plugin ouch";
          desc = "Compress with ouch";
        }
        {
          on = "<C-n>";
          run = ''shell 'ripdrag "$@" -x 2>/dev/null &' --confirm'';
        }
        {
          on = "m";
          run = ''shell 'shell "$@"' --confirm'';
          desc = "Move selected items";
        }
        {
          on = "<C-s>";
          run = "plugin kdeconnect-send";
          desc = "Send selected files via KDE Connect";
        }
      ];
    };

    settings = {
      # enable_mouse_support = true;

      log = {
        enabled = false;
      };

      mgr = {
        sort_dir_first = true;
        sort_reverse = true;
      };

      ratio = [
        1
        2
        4
      ];

      preview = {
        image_filter = "ueberzug";
        image_quality = 90;
        tab_size = 4;
        max_width = 1366;
        max_height = 760;
        ueberzug_scale = 1;
        ueberzug_offset = [
          0
          0
          0
          0
        ];
      };

      opener = {
        pdf = [
          {
            run = ''sioyek "$@" '';
            orphan = true;
            for = "unix";
          }
        ];
        img = [
          {
            run = ''qimgv "$@" '';
            orphan = true;
            for = "unix";
          }
        ];
        edit = [
          {
            run = ''nvim "$@" '';
            block = true;
            for = "unix";
          }
        ];
        mpv = [
          {
            run = ''mpv "$@" '';
            orphan = true;
            for = "unix";
          }
        ];
        ark = [
          {
            run = ''ark "$@" '';
            orphan = true;
            for = "unix";
          }
        ];
        extract = [
          {
            run = ''ouch d -y "$@" '';
            desc = "Extract here with ouch";
            for = "unix";
          }
        ];

        EDITOR = [
          {
            run = ''nvim "$@"'';
            desc = "Run EDITOR";
          }
        ];
      };

      open = {
        prepend_rules = [
          {
            url = "*.pdf";
            use = "pdf";
          }
          {
            url = "*.jpg";
            use = "img";
          }
          {
            url = "*.png";
            use = "img";
          }
          {
            url = "*.gif";
            use = "img";
          }
          {
            url = "*.bmp";
            use = "img";
          }
          {
            url = "*.svg";
            use = "img";
          }
          {
            url = "*.ico";
            use = "img";
          }
          {
            url = "*.heic";
            use = "img";
          }
          {
            url = "*.jpeg";
            use = "img";
          }
          {
            url = "*.tiff";
            use = "img";
          }
          {
            url = "*.webp";
            use = "img";
          }
          {
            url = "*.mp4";
            use = "mpv";
          }
          {
            url = "*.zip";
            use = "ark";
          }
          {
            url = "*.tar";
            use = "ark";
          }
          {
            url = "*.gz";
            use = "ark";
          }
          {
            url = "*.bz2";
            use = "ark";
          }
          {
            url = "*.xz";
            use = "ark";
          }
          {
            url = "*.7z";
            use = "ark";
          }
          {
            url = "*.rar";
            use = "ark";
          }
          {
            url = "*.tar.gz";
            use = "ark";
          }
          {
            url = "*.tgz";
            use = "ark";
          }
          {
            url = "*.tar.bz2";
            use = "ark";
          }
          {
            url = "*.tbz2";
            use = "ark";
          }
          {
            url = "*.tar.xz";
            use = "ark";
          }
          {
            url = "*.txz";
            use = "ark";
          }
          {
            url = "*.lz";
            use = "ark";
          }
          {
            url = "*.lzma";
            use = "ark";
          }
          {
            url = "*.zst";
            use = "ark";
          }
          {
            url = "*.zstd";
            use = "ark";
          }
          {
            url = "*.cab";
            use = "ark";
          }
          {
            url = "*.iso";
            use = "ark";
          }
          {
            url = "*.apk";
            use = "ark";
          }
          {
            url = "*.jar";
            use = "ark";
          }
        ];
      };

      plugin = {
        prepend_fetchers = [
          {
            id = "git";
            url = "*";
            run = "git";
            group = "";
          }
          {
            id = "git";
            url = "/";
            run = "git";
            group = "";
          }
        ];

        prepend_previewers = [
          {
            mime = "application/*zip";
            run = "ouch";
          }
          {
            mime = "application/x-tar";
            run = "ouch";
          }
          {
            mime = "application/x-bzip2";
            run = "ouch";
          }
          {
            mime = "application/x-7z-compressed";
            run = "ouch";
          }
          {
            mime = "application/x-rar";
            run = "ouch";
          }
          {
            mime = "application/x-xz";
            run = "ouch";
          }
          {
            mime = "application/xz";
            run = "ouch";
          }
          # Glow preview
          {
            url = "*.md";
            run = "glow";
          }
        ];
      };
    };

    plugins = with pkgs; {
      diff = yaziPlugins.diff;
      full-border = yaziPlugins.full-border;
      git = yaziPlugins.git;
      mount = yaziPlugins.mount;
      ouch = yaziPlugins.ouch;
      rich-preview = yaziPlugins.rich-preview;
      yatline = yaziPlugins.yatline;
      # glow = yaziPlugins.glow;
      kdeconnect-send = ./plugins/kdeconnect-send.yazi;
    };
  };
}
