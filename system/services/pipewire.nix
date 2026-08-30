{
  # Pipewire
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    jack.enable = false;
    # extraConfig.pipewire."99-disable-bell" = {
    #   "context.modules" = [
    #     {
    #       name = "libpipewire-module-x11-bell";
    #       condition = [ { "exec.session.type" = "disabled"; } ];
    #     }
    #   ];
    # };
  };
}
