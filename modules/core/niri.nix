{
  pkgs,
  unstable,
  ...
}:
{
  programs.niri = {
    enable = true;
    package = unstable.niri;
  };
}
