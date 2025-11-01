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
        "customLaunchPrefix" = "";
        "customLaunchPrefixEnabled" = false;
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
        "floating" = false;
        "marginHorizontal" = 0.25;
        "marginVertical" = 0.25;
        "monitors" = [ ];
        "position" = "left";
        "showCapsule" = true;
        "widgets" = {
          "center" = [
            {
              "id" = "Spacer";
              "width" = 20;
            }
            {
              "displayMode" = "forceOpen";
              "id" = "KeyboardLayout";
            }
          ];
          "left" = [
            {
              "customIconPath" = "";
              "icon" = "";
              "id" = "ControlCenter";
              "useDistroLogo" = true;
            }
            {
              "customFont" = "";
              "formatHorizontal" = "HH:mm ddd, MMM dd";
              "formatVertical" = "HH mm - dd MM";
              "id" = "Clock";
              "useCustomFont" = false;
              "usePrimaryColor" = true;
            }
            {
              "displayMode" = "onhover";
              "id" = "Brightness";
            }
            {
              "displayMode" = "onhover";
              "id" = "Volume";
            }
            {
              "displayMode" = "onhover";
              "id" = "Battery";
              "warningThreshold" = 30;
            }
            {
              "hideWhenZero" = true;
              "id" = "NotificationHistory";
              "showUnreadBadge" = true;
            }
            { "id" = "ScreenRecorder"; }
            { "id" = "WallpaperSelector"; }
            {
              "blacklist" = [ ];
              "colorizeIcons" = false;
              "id" = "Tray";
            }
          ];
          "right" = [
            {
              "characterCount" = 1;
              "hideUnoccupied" = false;
              "id" = "Workspace";
              "labelMode" = "none";
            }
            {
              "id" = "SystemMonitor";
              "showCpuTemp" = true;
              "showCpuUsage" = true;
              "showDiskUsage" = true;
              "showMemoryAsPercent" = false;
              "showMemoryUsage" = true;
              "showNetworkStats" = false;
            }
          ];
        };
      };
      "battery" = {
        "chargingMode" = 0;
      };
      "brightness" = {
        "brightnessStep" = 5;
        "enforceMinimum" = true;
      };
      "colorSchemes" = {
        "darkMode" = true;
        "generateTemplatesForPredefined" = true;
        "manualSunrise" = "06:30";
        "manualSunset" = "18:30";
        "matugenSchemeType" = "scheme-fruit-salad";
        "predefinedScheme" = "Noctalia (default)";
        "schedulingMode" = "off";
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
        "size" = 1;
      };
      "general" = {
        "animationDisabled" = false;
        "animationSpeed" = 1;
        "avatarImage" = "/home/vitor/.face";
        "compactLockScreen" = true;
        "dimDesktop" = false;
        "forceBlackScreenCorners" = false;
        "language" = "";
        "lockOnSuspend" = true;
        "radiusRatio" = 0.45;
        "scaleRatio" = 0.8;
        "screenRadiusRatio" = 0.55;
        "showScreenCorners" = true;
      };
      "hooks" = {
        "darkModeChange" = "";
        "enabled" = true;
        "wallpaperChange" = "cp $1 ~/.wallpaper || rm -rf ~/.wallpaper && cp $1 ~/.wallpaper";
      };
      "location" = {
        "analogClockInCalendar" = false;
        "name" = "Goiânia, GO";
        "showCalendarEvents" = true;
        "showWeekNumberInCalendar" = false;
        "use12hourFormat" = false;
        "useFahrenheit" = false;
        "weatherEnabled" = true;
      };
      "network" = {
        "wifiEnabled" = true;
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
        "criticalUrgencyDuration" = 15;
        "doNotDisturb" = false;
        "location" = "top_right";
        "lowUrgencyDuration" = 3;
        "monitors" = [ ];
        "normalUrgencyDuration" = 8;
        "overlayLayer" = true;
        "respectExpireTimeout" = false;
      };
      "osd" = {
        "autoHideMs" = 2000;
        "enabled" = true;
        "location" = "top_right";
        "monitors" = [ ];
        "overlayLayer" = true;
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
      "settingsVersion" = 16;
      "setupCompleted" = true;
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
        "vicinae" = false;
      };
      "ui" = {
        "fontDefault" = "MonaspiceRn Nerd Font";
        "fontDefaultScale" = 1;
        "fontFixed" = "MonaspiceRn Nerd Font Mono";
        "fontFixedScale" = 1;
        "panelsOverlayLayer" = true;
        "tooltipsEnabled" = true;
      };
      "wallpaper" = {
        "defaultWallpaper" =
          "/nix/store/2lpnigvpbcvwzihkk6jz2js1bq1zhz1k-noctalia-shell-1067ffe7a34067816fc72914ea0a71aa0dbdacc6/share/noctalia-shell/Assets/Wallpaper/noctalia.png";
        "directory" = "/home/vitor/Pictures/Wallpapers";
        "enableMultiMonitorDirectories" = false;
        "enabled" = true;
        "fillColor" = "#000000";
        "fillMode" = "crop";
        "monitors" = [
          {
            "directory" = "/home/vitor/Pictures/Wallpapers";
            "name" = "LVDS-1";
            "wallpaper" = "/home/vitor/.wallpaper";
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
