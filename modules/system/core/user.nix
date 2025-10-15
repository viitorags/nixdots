{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    enableGlobalCompInit = false;
  };

  users = {
    defaultUserShell = pkgs.zsh;

    users.vitor = {
      isNormalUser = true;
      description = "Vitor";
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
        "libvirtd"
      ];
      ignoreShellProgramCheck = true;
    };
  };
}
