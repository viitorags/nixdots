{
  lib,
  stdenv,
  fetchurl,
  unzip,
  autoPatchelfHook,
}:

stdenv.mkDerivation rec {
  pname = "bun-baseline";
  version = "1.3.12";

  src = fetchurl {
    url = "https://github.com/oven-sh/bun/releases/download/bun-v${version}/bun-linux-x64-baseline.zip";
    hash = "sha256-+Ls3eprpPURpf/kaJhEWTSrtySY0FdYjsMOvJKb1Xas=";
  };

  nativeBuildInputs = [
    unzip
    autoPatchelfHook
  ];

  buildInputs = [
    stdenv.cc.cc.lib
  ];

  sourceRoot = ".";

  installPhase = ''
    mkdir -p $out/bin
    install -Dm755 */bun $out/bin/bun
  '';

  meta = {
    description = "Bun baseline executable";
    homepage = "https://bun.sh";
    license = lib.licenses.mit;
    mainProgram = "bun";
    platforms = [ "x86_64-linux" ];
  };
}
