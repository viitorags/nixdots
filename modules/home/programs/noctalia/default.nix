{
  config,
  pkgs,
  noctalia,
  ...
}:
{
  imports = [ noctalia.homeModules.default ];

  home = {
    packages = with pkgs; [
      noctalia.packages.${system}.default
    ];
  };

  programs.noctalia-shell = with config.lib.stylix.colors; {
    enable = true;
    colors = {
      mError = "#${base08}";
      mOnError = "#${base00}";
      mOnPrimary = "#${base00}";
      mOnSecondary = "#${base00}";
      mOnSurface = "#${base04}";
      mOnSurfaceVariant = "#${base04}";
      mOnTertiary = "#${base00}";
      mOutline = "#${base02}";
      mPrimary = "#${base0B}";
      mSecondary = "#${base0A}";
      mShadow = "#${base00}";
      mSurface = "#${base00}";
      mSurfaceVariant = "#${base01}";
      mTertiary = "#${base0D}";
    };
    settings = {
      "appLauncher" = {
        "backgroundOpacity" = 1;
        "enableClipboardHistory" = true;
        "pinnedExecs" = [ ];
        "position" = "center";
        "sortByMostUsed" = true;
        "terminalCommand" = "xterm -e";
        "useApp2Unit" = false;
      };
      "audio" = {
        "cavaFrameRate" = 60;
        "mprisBlacklist" = [ ];
        "preferredPlayer" = "";
        "visualizerType" = "wave";
        "volumeOverdrive" = false;
        "volumeStep" = 5;
      };
      "bar" = {
        "backgroundOpacity" = 1;
        "density" = "comfortable";
        "floating" = true;
        "marginHorizontal" = 1;
        "marginVertical" = 0.2;
        "monitors" = [ ];
        "position" = "top";
        "showCapsule" = true;
        "widgets" = {
          "center" = [
            {
              "id" = "SystemMonitor";
              "showCpuTemp" = true;
              "showCpuUsage" = true;
              "showDiskUsage" = true;
              "showMemoryAsPercent" = false;
              "showMemoryUsage" = true;
              "showNetworkStats" = false;
            }
            {
              "displayMode" = "forceOpen";
              "id" = "KeyboardLayout";
            }
          ];
          "left" = [
            {
              "hideUnoccupied" = false;
              "id" = "Workspace";
              "labelMode" = "none";
            }
            {
              "hideMode" = "transparent";
              "id" = "MediaMini";
              "scrollingMode" = "hover";
              "showAlbumArt" = false;
              "showVisualizer" = false;
              "visualizerType" = "linear";
            }
          ];
          "right" = [
            {
              "blacklist" = [ ];
              "colorizeIcons" = true;
              "id" = "Tray";
            }
            { "id" = "ScreenRecorder"; }
            { "id" = "WallpaperSelector"; }
            {
              "hideWhenZero" = true;
              "id" = "NotificationHistory";
              "showUnreadBadge" = true;
            }
            {
              "displayMode" = "onhover";
              "id" = "Battery";
              "warningThreshold" = 30;
            }
            {
              "displayMode" = "onhover";
              "id" = "Volume";
            }
            {
              "displayMode" = "onhover";
              "id" = "Brightness";
            }
            {
              "customFont" = "";
              "formatHorizontal" = "HH:mm dd.MM.yyyy";
              "formatVertical" = "HH mm - dd MM";
              "id" = "Clock";
              "useCustomFont" = false;
              "usePrimaryColor" = true;
            }
            {
              "customIconPath" = "";
              "icon" = "";
              "id" = "ControlCenter";
              "useDistroLogo" = true;
            }
          ];
        };
      };
      "brightness" = {
        "brightnessStep" = 5;
      };
      "colorSchemes" = {
        "darkMode" = true;
        "generateTemplatesForPredefined" = true;
        "matugenSchemeType" = "scheme-fruit-salad";
        "predefinedScheme" = "Noctalia (default)";
        "useWallpaperColors" = false;
      };
      "controlCenter" = {
        "cards" = [
          {
            "enabled" = true;
            "id" = "profile-card";
          }
          {
            "enabled" = true;
            "id" = "shortcuts-card";
          }
          {
            "enabled" = false;
            "id" = "audio-card";
          }
          {
            "enabled" = true;
            "id" = "weather-card";
          }
          {
            "enabled" = true;
            "id" = "media-sysmon-card";
          }
        ];
        "position" = "close_to_bar_button";
        "shortcuts" = {
          "left" = [
            { "id" = "WiFi"; }
            { "id" = "Bluetooth"; }
            { "id" = "ScreenRecorder"; }
            { "id" = "WallpaperSelector"; }
          ];
          "right" = [
            { "id" = "Notifications"; }
            { "id" = "PowerProfile"; }
            { "id" = "KeepAwake"; }
            { "id" = "NightLight"; }
          ];
        };
      };
      "dock" = {
        "backgroundOpacity" = 1;
        "colorizeIcons" = false;
        "displayMode" = "always_visible";
        "floatingRatio" = 1;
        "monitors" = [ ];
        "onlySameOutput" = true;
        "pinnedApps" = [ ];
      };
      "general" = {
        "animationDisabled" = false;
        "animationSpeed" = 1;
        "avatarImage" = "/home/vitor/.face";
        "compactLockScreen" = false;
        "dimDesktop" = false;
        "forceBlackScreenCorners" = false;
        "radiusRatio" = 1;
        "scaleRatio" = 0.8;
        "screenRadiusRatio" = 1;
        "showScreenCorners" = true;
      };
      "hooks" = {
        "darkModeChange" = "";
        "enabled" = true;
        "wallpaperChange" = "cp $1 ~/.wallpaper || rm -rf ~/.wallpaper && cp $1 ~/.wallpaper";
      };
      "location" = {
        "name" = "Goiânia";
        "showWeekNumberInCalendar" = false;
        "use12hourFormat" = false;
        "useFahrenheit" = false;
      };
      "network" = {
        "wifiEnabled" = false;
      };
      "nightLight" = {
        "autoSchedule" = true;
        "dayTemp" = "6500";
        "enabled" = false;
        "forced" = false;
        "manualSunrise" = "06:30";
        "manualSunset" = "18:30";
        "nightTemp" = "4000";
      };
      "notifications" = {
        "alwaysOnTop" = false;
        "criticalUrgencyDuration" = 15;
        "doNotDisturb" = false;
        "lastSeenTs" = 0;
        "location" = "top_right";
        "lowUrgencyDuration" = 3;
        "monitors" = [ ];
        "normalUrgencyDuration" = 8;
        "respectExpireTimeout" = false;
      };
      "osd" = {
        "alwaysOnTop" = false;
        "autoHideMs" = 2000;
        "enabled" = true;
        "location" = "top_right";
        "monitors" = [ ];
      };
      "screenRecorder" = {
        "audioCodec" = "opus";
        "audioSource" = "default_output";
        "colorRange" = "limited";
        "directory" = "/home/vitor/Videos";
        "frameRate" = 60;
        "quality" = "very_high";
        "showCursor" = true;
        "videoCodec" = "h264";
        "videoSource" = "portal";
      };
      "settingsVersion" = 15;
      "templates" = {
        "discord" = false;
        "discord_armcord" = false;
        "discord_dorion" = false;
        "discord_equibop" = false;
        "discord_lightcord" = false;
        "discord_vesktop" = false;
        "discord_webcord" = false;
        "enableUserTemplates" = false;
        "foot" = false;
        "fuzzel" = false;
        "ghostty" = false;
        "gtk" = false;
        "kcolorscheme" = false;
        "kitty" = false;
        "pywalfox" = false;
        "qt" = false;
      };
      "ui" = {
        "fontDefault" = "Sarasa Mono CL";
        "fontDefaultScale" = 1;
        "fontFixed" = "Sarasa Mono CL";
        "fontFixedScale" = 1;
        "idleInhibitorEnabled" = false;
        "tooltipsEnabled" = true;
      };
      "wallpaper" = {
        "defaultWallpaper" =
          "/nix/store/3yyvlqjsk20hz11d2xv650897l3qan9d-noctalia-shell-c336387a1830b708ca28dd3e1af1c2236d1c9acd/share/noctalia-shell/Assets/Wallpaper/noctalia.png";
        "directory" = "/home/vitor/Pictures/Wallpapers";
        "enableMultiMonitorDirectories" = false;
        "enabled" = true;
        "fillColor" = "#000000";
        "fillMode" = "crop";
        "monitors" = [
          {
            "directory" = "/home/vitor/Pictures/Wallpapers";
            "name" = "LVDS-1";
            "wallpaper" = "/home/vitor/Pictures/Wallpapers/Anime-Purple-eyes.png";
          }
        ];
        "randomEnabled" = false;
        "randomIntervalSec" = 300;
        "setWallpaperOnAllMonitors" = true;
        "transitionDuration" = 1500;
        "transitionEdgeSmoothness" = 0.05;
        "transitionType" = "random";
      };
    };
  };
}
