{
  config,
  pkgs,
  lib,
  vars,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./core
  ];

  networking.hostName = "kaizen";
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_zen;

  services.tailscale.enable = true;

  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      INTEL_GPU_MIN_FREQ_ON_AC = 850;
      INTEL_GPU_MAX_FREQ_ON_AC = 1350;
      INTEL_GPU_BOOST_FREQ_ON_AC = 1350;

      SOUND_POWER_SAVE_ON_AC = 0;

      WIFI_PWR_ON_AC = "off";

      USB_AUTOSUSPEND = 0;
    };
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.settings.auto-optimise-store = true;

  nix.settings = {
    substituters = [
      "https://viitorags.cachix.org"
    ];

    trusted-public-keys = [
      "viitorags.cachix.org-1:XjszObjD+IWSHIB37cprlJogQkkKgWLtcBRH7pi/gpE="
    ];

    fallback = false;
  };

  networking.firewall = rec {
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
      {
        from = 24800;
        to = 24800;
      }
      {
        from = 53317;
        to = 53317;
      }
    ];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };

  networking.networkmanager.enable = true;

  networking.nameservers = [
    "1.1.1.2"
    "8.8.8.8"
  ];

  networking.extraHosts = ''
    140.82.113.6 api.github.com
    140.82.113.3 github.com
  '';

  networking.nftables.enable = true;

  time.timeZone = vars.timeZone;

  i18n.defaultLocale = vars.defaultLocale;

  i18n.extraLocaleSettings = {
    LC_ADDRESS = vars.extraLocale;
    LC_IDENTIFICATION = vars.extraLocale;
    LC_MEASUREMENT = vars.extraLocale;
    LC_MONETARY = vars.extraLocale;
    LC_NAME = vars.extraLocale;
    LC_NUMERIC = vars.extraLocale;
    LC_PAPER = vars.extraLocale;
    LC_TELEPHONE = vars.extraLocale;
    LC_TIME = vars.extraLocale;
  };

  console.keyMap = "br-abnt2";

  nixpkgs.config.allowUnfree = true;

  services.printing = {
    enable = true;
    drivers = with pkgs; [
      gutenprint
      epson-escpr
    ];
  };

  services.udev.extraRules = ''
    ACTION=="add|change", KERNEL=="sd[a-z]*", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="bfq"
    ACTION=="add", SUBSYSTEM=="leds", KERNEL=="*::scrolllock", RUN+="/bin/sh -c 'chmod 666 /sys/class/leds/%k/brightness /sys/class/leds/%k/trigger'"
  '';

  system.stateVersion = "26.05";
}
