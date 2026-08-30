{
  inputs,
  unstable,
  ...
}:
{
  imports = [
    inputs.dms.nixosModules.greeter
  ];

  programs.dank-material-shell.greeter = {
    enable = true;
    quickshell.package = unstable.quickshell;

    compositor = {
      name = "niri";
    };

    configHome = "/home/vitor";

    configFiles = [
      "/home/vitor/.config/DankMaterialShell/settings.json"
    ];

    logs = {
      save = true;
      path = "/tmp/dms-greeter.log";
    };
  };

  environment.systemPackages = [
    unstable.dms-shell
  ];
}
