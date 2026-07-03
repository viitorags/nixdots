{
  config,
  pkgs,
  inputs,
  unstable,
  ...
}:
{
  programs.dank-material-shell = {
    enable = false;
    # quickshell.package = inputs.quickshell.packages."${pkgs.stdenv.hostPlatform.system}".default;
    quickshell.package = unstable.quickshell;
    dgop.package = unstable.dgop;

    systemd = {
      enable = true;
      restartIfChanged = true;
    };

    # enableSystemMonitoring = true;
    # enableSystemMonitoring = true;
    # enableVPN = true;
    # enableDynamicTheming = false;
    # enableAudioWavelength = true;
    # enableCalendarEvents = true;
    # enableClipboardPaste = true;
  };

  xdg.configFile."DankMaterialShell/themes/Stylix/theme.json".text =
    with config.lib.stylix.colors.withHashtag; ''
      {
        "id": "stylix",
        "name": "Stylix",
        "dark": {
          "primary": "${base0D}",
          "primaryText": "${base00}",
          "primaryContainer": "${base03}",
          "secondary": "${base0E}",
          "surface": "${base01}",
          "surfaceText": "${base05}",
          "surfaceVariant": "${base01}",
          "surfaceVariantText": "${base09}",
          "surfaceTint": "${base0D}",
          "background": "${base00}",
          "backgroundText": "${base05}",
          "outline": "${base03}",
          "surfaceContainer": "${base00}",
          "surfaceContainerHigh": "${base01}",
          "surfaceContainerHighest": "${base03}",
          "error": "${base0F}",
          "warning": "${base0E}",
          "info": "${base0C}"
        }
      }
    '';
}
