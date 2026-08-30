{ lib, stdenv, fetchFromGitHub, kernel }:

stdenv.mkDerivation {
  pname = "aic8800dc";
  version = "6.4.3.0-patched.4";

  src = fetchFromGitHub {
    owner = "Kiborgik";
    repo = "aic8800dc-linux-patched";
    rev = "a1686c0be7569d0545c1b7478f4be199df3c6a82";
    hash = "sha256-YNkpu4z3YE4npoj9aL6WuU43xzIREqTUq6EItxEvoNk=";
  };

  nativeBuildInputs = kernel.moduleBuildDependencies;

  patchPhase = ''
    sed -i 's/CONFIG_USE_FW_REQUEST = n/CONFIG_USE_FW_REQUEST = y/' \
      drivers/aic8800/aic8800_fdrv/Makefile
  '';

  buildPhase = ''
    make -C drivers/aic8800 KDIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build
  '';

  installPhase = ''
    install -Dm644 drivers/aic8800/aic_load_fw/aic_load_fw.ko \
      "$out/lib/modules/${kernel.modDirVersion}/updates/aic_load_fw.ko"
    install -Dm644 drivers/aic8800/aic8800_fdrv/aic8800_fdrv.ko \
      "$out/lib/modules/${kernel.modDirVersion}/updates/aic8800_fdrv.ko"
    mkdir -p "$out/lib/firmware"
    cp fw/aic8800DC/* "$out/lib/firmware/"
  '';

  meta = {
    description = "AIC8800DC USB Wi-Fi kernel driver";
    homepage = "https://github.com/Kiborgik/aic8800dc-linux-patched";
    license = lib.licenses.gpl3;
    platforms = [ "x86_64-linux" "aarch64-linux" ];
  };
}
