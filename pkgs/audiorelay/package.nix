{
  lib,
  stdenv,
  fetchurl,
  autoPatchelfHook,
  makeWrapper,
  makeDesktopItem,
  copyDesktopItems,
  alsa-lib,
  libpulseaudio,
  libx11,
  libxext,
  libxrender,
  libxtst,
  libxi,
  freetype,
  zlib,
  glib,
  gtk3,
  libGL,
  libxkbcommon,
  fontconfig,
  openjdk17,
}:

let
  runtimeLibs = [
    stdenv.cc.cc.lib
    alsa-lib
    libpulseaudio
    libx11
    libxext
    libxrender
    libxtst
    libxi
    freetype
    zlib
    glib
    gtk3
    libGL
    libxkbcommon
    fontconfig
  ];
in
stdenv.mkDerivation rec {
  pname = "audiorelay";
  version = "0.27.5";

  src = fetchurl {
    url = "https://dl.audiorelay.net/setups/linux/audiorelay-${version}.tar.gz";
    hash = "sha256-xIVBOaS9Iee/eIGntuIevEz+gjKGeD1Pua1L9O346Mc=";
  };

  sourceRoot = ".";

  nativeBuildInputs = [
    autoPatchelfHook
    makeWrapper
    copyDesktopItems
  ];

  buildInputs = runtimeLibs ++ [ openjdk17 ];

  desktopItems = [
    (makeDesktopItem {
      name = "audiorelay";
      exec = "audiorelay";
      icon = "audiorelay";
      desktopName = "AudioRelay";
      genericName = "Audio Streaming";
      comment = "Stream audio between your devices";
      categories = [ "AudioVideo" "Audio" ];
      keywords = [ "audio" "stream" "relay" ];
    })
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin $out/lib/audiorelay

    # Copy the jar
    cp lib/app/audiorelay.jar $out/lib/audiorelay/

    # Copy the native libraries
    cp lib/runtime/lib/libnative-*.so $out/lib/audiorelay/

    # Ensure write permissions for patchelf
    chmod -R +w $out

    # Install desktop icon
    mkdir -p $out/share/icons/hicolor/512x512/apps
    cp lib/AudioRelay.png $out/share/icons/hicolor/512x512/apps/audiorelay.png

    # Wrapper to launch the app using openjdk17
    # Note: We must run with -cp com.azefsw.audioconnect.desktop.app.MainKt instead of -jar
    # because the jar does not define a Main-Class in its manifest.
    makeWrapper ${openjdk17}/bin/java $out/bin/audiorelay \
      --add-flags "-Djava.library.path=$out/lib/audiorelay -cp $out/lib/audiorelay/audiorelay.jar com.azefsw.audioconnect.desktop.app.MainKt" \
      --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath runtimeLibs}:$out/lib/audiorelay"

    runHook postInstall
  '';

  meta = with lib; {
    description = "Stream audio from your PC to your phone, or from phone to PC";
    homepage = "https://audiorelay.net";
    license = licenses.unfree;
    platforms = [ "x86_64-linux" ];
    mainProgram = "audiorelay";
  };
}
