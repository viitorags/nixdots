{
  config,
  pkgs,
  ...
}:
{
  imports = [
    # Server specific programs can be added here
  ];

  # Minimal server-specific home-manager config
  home.sessionVariables = {
    # Any server-specific env vars
  };
}
