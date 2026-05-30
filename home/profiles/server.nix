{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ../programs/kitty
  ];

  # Minimal server-specific home-manager config
  home.sessionVariables = {
    # Any server-specific env vars
  };
}
