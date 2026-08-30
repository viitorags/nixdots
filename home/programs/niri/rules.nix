{
  programs.niri = {
    enable = true;

    settings = {
      layer-rules = [
        { matches = [ { namespace = "^quickshell-wallpaper$"; } ]; }
        {
          matches = [
            { namespace = "^dms-backdrop*"; }
            { namespace = "^noctalia-backdrop"; }
          ];
          place-within-backdrop = true;
        }
      ];

      window-rules = [
        {
          opacity = 0.8;
          draw-border-with-background = false;

          background-effect = {
            blur = true;
          };

          focus-ring = {
            width = 2;
            active.color = "#957FB8";
            inactive.color = "#505050";
          };

          geometry-corner-radius = {
            bottom-left = 12.0;
            bottom-right = 12.0;
            top-left = 12.0;
            top-right = 12.0;
          };
          clip-to-geometry = true;
        }
        {
          matches = [
            {
              app-id = ''r#"^org\.wezfurlong\.wezterm$"#'';
            }
          ];
        }
        {
          matches = [
            { is-floating = true; }
          ];
          shadow.enable = true;
        }
        {
          matches = [ { app-id = "org.telegram.desktop"; } ];
          block-out-from = "screencast";
        }
        {
          matches = [
            { app-id = "zen-beta"; }
            { app-id = "firefox"; }
            { app-id = "chromium-browser"; }
            { app-id = "xdg-desktop-portal-gtk"; }
          ];
          scroll-factor = 0.5;
        }
        {
          matches = [
            { app-id = "zen-beta"; }
            { app-id = "firefox"; }
            { app-id = "chromium-browser"; }
            { app-id = "edge"; }
          ];
          open-maximized = true;
          opacity = 1.0;
        }
        {
          matches = [
            {
              app-id = "firefox";
              title = "Picture-in-Picture";
            }
          ];
          open-floating = true;
          default-floating-position = {
            x = 32;
            y = 32;
            relative-to = "bottom-right";
          };
          default-column-width = {
            fixed = 480;
          };
          default-window-height = {
            fixed = 270;
          };
        }
        {
          matches = [ { title = "Picture in picture"; } ];
          open-floating = true;
          default-floating-position = {
            x = 32;
            y = 32;
            relative-to = "bottom-right";
          };
        }
        {
          matches = [ { title = "Discord Popout"; } ];
          open-floating = true;
          default-floating-position = {
            x = 32;
            y = 32;
            relative-to = "bottom-right";
          };
        }
        {
          matches = [
            { app-id = "sioyek"; }
            { app-id = "speedynote"; }
            { app-id = "com.github.xournalpp.xournalpp"; }
          ];
          opacity = 1.0;
        }
        {
          matches = [ { app-id = "pavucontrol"; } ];
          open-floating = false;
        }
        {
          matches = [ { app-id = "pavucontrol-qt"; } ];
          open-floating = false;
        }
        {
          matches = [
            { app-id = "com.saivert.pwvucontrol"; }
            { app-id = "^kitty-float$"; }
          ];
          open-floating = true;
        }
        {
          matches = [ { app-id = "dialog"; } ];
          open-floating = true;
        }
        {
          matches = [ { app-id = "popup"; } ];
          open-floating = true;
        }
        {
          matches = [ { app-id = "task_dialog"; } ];
          open-floating = true;
        }
        {
          matches = [ { app-id = "gcr-prompter"; } ];
          open-floating = true;
        }
        {
          matches = [ { app-id = "file-roller"; } ];
          open-floating = true;
        }
        {
          matches = [ { app-id = "org.gnome.FileRoller"; } ];
          open-floating = true;
        }
        {
          matches = [ { app-id = "nm-connection-editor"; } ];
          open-floating = true;
        }
        {
          matches = [ { app-id = "blueman-manager"; } ];
          open-floating = true;
        }
        {
          matches = [ { app-id = "xdg-desktop-portal-gtk"; } ];
          open-floating = true;
        }
        {
          matches = [ { app-id = "org.kde.polkit-kde-authentication-agent-1"; } ];
          open-floating = true;
        }
        {
          matches = [ { app-id = "pinentry"; } ];
          open-floating = true;
        }
        {
          matches = [ { title = "Progress"; } ];
          open-floating = true;
        }
        {
          matches = [ { title = "File Operations"; } ];
          open-floating = true;
        }
        {
          matches = [ { title = "Copying"; } ];
          open-floating = true;
        }
        {
          matches = [ { title = "Moving"; } ];
          open-floating = true;
        }
        {
          matches = [ { title = "Properties"; } ];
          open-floating = true;
        }
        {
          matches = [ { title = "Downloads"; } ];
          open-floating = true;
        }
        {
          matches = [ { title = "file progress"; } ];
          open-floating = true;
        }
        {
          matches = [ { title = "Confirm"; } ];
          open-floating = true;
        }
        {
          matches = [ { title = "Authentication Required"; } ];
          open-floating = true;
        }
        {
          matches = [ { title = "Notice"; } ];
          open-floating = true;
        }
        {
          matches = [ { title = "Warning"; } ];
          open-floating = true;
        }
        {
          matches = [ { title = "Error"; } ];
          open-floating = true;
        }
      ];
    };
  };
}
