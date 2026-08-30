{ config, pkgs, lib, ... }:

let
  aic8800dc = pkgs.callPackage ../../pkgs/aic8800dc {
    kernel = config.boot.kernelPackages.kernel;
  };
in
{
  boot.extraModulePackages = [ aic8800dc ];
  boot.kernelModules = [ "aic_load_fw" "aic8800_fdrv" ];

  hardware.firmware = [ aic8800dc ];

  # Device enumerates as mass-storage (a69c:5721) before Wi-Fi mode; eject triggers switch
  services.udev.extraRules = ''
    ACTION=="add", KERNEL=="sd[a-z]", SUBSYSTEMS=="usb", ATTRS{idVendor}=="a69c", ATTRS{idProduct}=="5721", RUN+="${pkgs.util-linux}/bin/eject /dev/%k"
  '';
}
