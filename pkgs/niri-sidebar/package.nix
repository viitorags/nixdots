{
  stdenv,
  fetchurl,
  autoPatchelfHook,
}:
let
  version = "0.4.0";
in
stdenv.mkDerivation {
  pname = "niri-sidebar";
  inherit version;

  src = fetchurl {
    url = "https://github.com/Vigintillionn/niri-sidebar/releases/download/v${version}/niri-sidebar-linux-x86_64.tar.gz";
    hash = "sha256-kYzvdQBc2OrjlMgp+qMFmXs8Fks3tLllzjax1+L8xAM=";
  };

  sourceRoot = ".";

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  buildInputs = [
    stdenv.cc.cc.lib
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin

    cp niri-sidebar-linux-x86_64 $out/bin/niri-sidebar
    chmod +x $out/bin/niri-sidebar

    runHook postInstall
  '';
}
