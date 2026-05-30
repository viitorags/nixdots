{ lib, ... }:
{
  imports = [
    ../common
    ./hardware-configuration.nix
    ../../hardening
    ../../infra
    ../../modules/profiles/server
  ];

  networking.hostName = "slime";

  # Only allow access via Tailscale, SSH (via Tailscale) and Cloudflared
  networking.firewall = {
    enable = true;
    allowedTCPPorts = lib.mkForce [ ];
    allowedUDPPorts = lib.mkForce [ ];
    allowedTCPPortRanges = lib.mkForce [ ];
    allowedUDPPortRanges = lib.mkForce [ ];
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.xserver.xkb.options = "scrolllock:none";

  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "ondemand";

      CPU_MAX_PERF_ON_AC = 99;
      CPU_BOOST_ON_AC = 0;

      INTEL_GPU_MIN_FREQ_ON_AC = 349;
      INTEL_GPU_MAX_FREQ_ON_AC = 649;
    };
  };

  services.getty.autologinUser = "vitor";
  services.logind = {
    settings = {
      Login = {
        HandleLidSwitch = "ignore";
        HandleLidSwitchExternalPower = "ignore";
        HandleLidSwitchDocked = "ignore";
      };
    };
  };
}
