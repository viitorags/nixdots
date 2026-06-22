{
  wayland.windowManager.hyprland = {
    enable = true;

    xwayland = {
      enable = true;
    };

    extraConfig = ''
      -- Hyprland Config atualizado para Lua (Hyprland 0.55+)
      -- Localização: ~/.config/hypr/hyprland.lua
      -- Referência: https://wiki.hypr.land/Configuring/Start/

      ------------------
      ---- MONITORS ----
      ------------------

      hl.monitor({
          output = "HDMI-A-1",
          mode = "1440x900@74.997",
          position = "auto",
          scale = "1",
      })

      ---------------------
      ---- MY PROGRAMS ----
      ---------------------

      local terminal = "wezterm start"
      local fileManager = "wezterm start -- yazi"
      local menu = "noctalia msg panel-toggle launcher"
      local browser = "zen-beta"
      local editor = "wezterm start -- nvim"

      -------------------
      ---- AUTOSTART ----
      -------------------

      hl.on("hyprland.start", function ()
          hl.exec_cmd("dbus-update-activation-environment --systemd --all")
          hl.exec_cmd("systemctl --user start hyprpolkitagent.service")
          hl.exec_cmd("eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)")
          hl.exec_cmd("wl-paste --type text --watch cliphist store")
          hl.exec_cmd("wl-paste --type image --watch cliphist store")
      end)

      -------------------------------
      ---- ENVIRONMENT VARIABLES ----
      -------------------------------

      hl.env("SSH_AUTH_SOCK", "/run/user/1000/keyring/ssh")
      hl.env("XCURSOR_SIZE", "24")
      hl.env("HYPRCURSOR_SIZE", "24")
      hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
      hl.env("XDG_SESSION_TYPE", "wayland")
      hl.env("XDG_SESSION_DESKTOP", "Hyprland")
      hl.env("GDK_BACKEND", "wayland,x11,*")
      hl.env("SDL_VIDEO_DRIVER", "wayland")
      hl.env("MOZ_ENABLE_WAYLAND", "1")
      hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
      hl.env("QT_QPA_PLATFORM", "wayland;xcb")
      hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
      hl.env("XDG_MENU_PREFIX", "arch-")

      -----------------------
      ---- LOOK AND FEEL ----
      -----------------------

      hl.config({
          general = {
              gaps_in = 3,
              gaps_out = 5,
              border_size = 2,
              col = {
                  active_border = "rgba(8aadf4ff)",
                  inactive_border = "rgba(414868aa)",
              },
              resize_on_border = true,
              allow_tearing = false,
              layout = "dwindle",
          },

          decoration = {
              rounding = 10,
              rounding_power = 10,
              active_opacity = 0.8,
              inactive_opacity = 0.7,
              fullscreen_opacity = 1,
              
              shadow = {
                  enabled = false,
                  range = 4,
                  render_power = 3,
                  color = 0xee1a1a1a,
              },
              
              blur = {
                  enabled = true,
                  size = 2,
                  passes = 3,
                  vibrancy = 2,
              },
          },

          misc = {
              disable_hyprland_logo = true,
              disable_splash_rendering = true,
          },

          animations = {
              enabled = true,
          },
      })

      -- Bezier curves personalizados
      hl.curve("wind", { type = "bezier", points = {{0.05, 0.9}, {0.1, 1.05}} })
      hl.curve("winIn", { type = "bezier", points = {{0.1, 1.1}, {0.1, 1.1}} })
      hl.curve("winOut", { type = "bezier", points = {{0.3, -0.3}, {0, 1}} })
      hl.curve("linear", { type = "bezier", points = {{0, 0}, {1, 1}} })
      hl.curve("Cubic", { type = "bezier", points = {{0.1, 0.1}, {0.1, 1}} })
      hl.curve("overshot", { type = "bezier", points = {{0.05, 0.9}, {0.1, 1.1}} })
      hl.curve("ease-in-out", { type = "bezier", points = {{0.17, 0.67}, {0.83, 0.67}} })
      hl.curve("ease-in", { type = "bezier", points = {{0.17, 0.67}, {0.83, 0.67}} })
      hl.curve("ease-out", { type = "bezier", points = {{0.42, 0}, {1, 1}} })
      hl.curve("easeInOutSine", { type = "bezier", points = {{0.37, 0}, {0.63, 1}} })
      hl.curve("easeInSine", { type = "bezier", points = {{0.12, 0}, {0.39, 0}} })
      hl.curve("easeOutSine", { type = "bezier", points = {{0.61, 1}, {0.88, 1}} })

      -- Animações personalizados
      hl.animation({ leaf = "windowsIn", enabled = true, speed = 3, bezier = "easeInOutSine", style = "popin" })
      hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "easeInOutSine", style = "popin" })
      hl.animation({ leaf = "border", enabled = true, speed = 3, bezier = "easeInOutSine" })
      hl.animation({ leaf = "borderangle", enabled = true, speed = 30, bezier = "easeInOutSine", style = "loop" })
      hl.animation({ leaf = "workspacesIn", enabled = true, speed = 3, bezier = "easeInOutSine", style = "slidefade" })
      hl.animation({ leaf = "workspacesOut", enabled = true, speed = 3, bezier = "easeInOutSine", style = "slidefade" })
      hl.animation({ leaf = "specialWorkspaceIn", enabled = true, speed = 3, bezier = "easeInOutSine", style = "slidevert" })
      hl.animation({ leaf = "specialWorkspaceOut", enabled = true, speed = 3, bezier = "easeInOutSine", style = "slidevert" })
      hl.animation({ leaf = "layersIn", enabled = true, speed = 3, bezier = "easeInOutSine", style = "fade" })
      hl.animation({ leaf = "layersOut", enabled = true, speed = 3, bezier = "easeInOutSine", style = "fade" })

      -- Dwindle Layout (pseudotile removido em 0.55)
      hl.config({
          dwindle = {
              preserve_split = true,
          },
      })

      -- Master Layout
      hl.config({
          master = {
              new_status = "master",
          },
      })

      ---------------
      ---- INPUT ----
      ---------------

      hl.config({
          input = {
              kb_layout = "br",
              follow_mouse = 1,
              sensitivity = 0,
              touchpad = {
                  natural_scroll = false,
                  disable_while_typing = false,
              },
          },
      })

      --[[hl.gesture({
          workspace_swipe = false,
          fingers = 2,
          direction = "bottom"
      })]]

      -- Device específico
      hl.device({
          name = "epic-mouse-v1",
          sensitivity = -0.5,
      })

      ---------------------
      ---- KEYBINDINGS ----
      ---------------------

      local mainMod = "SUPER"

      -- Binds básicos
      hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
      hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd("[float; move 15% 5%; size 70% 40%] " .. terminal))
      hl.bind(mainMod .. " + Q", hl.dsp.window.close())
      hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exit())
      hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
      hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
      hl.bind(mainMod .. " + R", hl.dsp.window.fullscreen({ action = "toggle" }))
      hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(menu))
      hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("GDK_BACKEND=x11 dbeaver"))
      hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("bash -c ~/nixos-config/home/modules/hyprland/scripts/powermenu.sh"))
      hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
      hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
      hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
      hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle" }))
      hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(editor))
      hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("noctalia msg panel-toggle wallpaper"))
      hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("wlogout"))
      hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("noctalia msg panel-toggle clipboard"))

      -- Screenshot
      hl.bind(mainMod .. " + CTRL + SHIFT + insert", hl.dsp.exec_cmd("grim -g \"$(slurp)\" $(xdg-user-dir)/Pictures/Screenshots/$(date +'%s_grim.png')"))

      -- Move foco com arrow keys
      hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
      hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
      hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
      hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

      -- Switch workspaces com [0-9]
      for i = 1, 10 do
          local key = i % 10
          hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
          hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
      end

      -- Special workspace (scratchpad)
      hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
      hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

      -- Scroll workspaces
      hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
      hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

      -- Move/resize windows com LMB/RMB
      hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
      hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

      --------------------------------
      ---- WINDOWS AND WORKSPACES ----
      --------------------------------

      -- Window rules
      hl.window_rule({
          name = "tv1-borders",
          match = { float = false, workspace = "w[tv1]" },
          border_size = 2,
          rounding = 10,
      })

      hl.window_rule({
          name = "f1-borders",
          match = { float = false, workspace = "f[1]" },
          border_size = 2,
          rounding = 10,
      })

      hl.window_rule({
          name = "rofi-opacity",
          match = { class = "^Rofi$" },
          opacity = 0.9,
      })

      hl.window_rule({
          name = "brave-noblur",
          match = { class = "^Brave-browser$" },
          no_blur = true,
      })

      hl.window_rule({
          name = "suppress-maximize",
          match = { class = ".*" },
          suppress_event = "maximize",
      })

      hl.window_rule({
          name = "fix-xwayland-drags",
          match = {
              class = "^$",
              title = "^$",
              xwayland = true,
              float = true,
              fullscreen = false,
              pin = false,
          },
          no_focus = true,
      })

      -- Layer rules
      hl.layer_rule({
          name = "blur-rofi",
          match = { namespace = "^rofi$" },
          blur = true,
          --ignore_zero = true,
      })

      hl.layer_rule({
          name = "blur-waybar",
          match = { namespace = "^waybar$" },
          blur = true,
          --ignore_zero = true,
      })

      hl.layer_rule({
          name = "blur-swaync-cc",
          match = { namespace = "^swaync-control-center$" },
          blur = true,
          --ignore_zero = true,
          --ignore_alpha = 0.5,
      })

      hl.layer_rule({
          name = "blur-swaync-notif",
          match = { namespace = "^swaync-notification-window$" },
          blur = true,
          --ignore_zero = true,
          ignore_alpha = 0.5,
      })
      hl.window_rule({
        name = "zen-browser",
        match = { namespace = "^zen-beta$" },
        no_blur = true,
        opacity = 1,
      })
      hl.layer_rule({
        name = "noctalia",
        match = {
          namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd)$",
        },
        no_anim = true,
        ignore_alpha = 0.5,
        blur = true,
        blur_popups = true,
      })
    '';
  };
}
