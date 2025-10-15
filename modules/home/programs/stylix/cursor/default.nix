{
  stdenv,
  ...
}:
stdenv.mkDerivation {
  pname = "cursor-mouse";
  version = "1.0";

  src = ./Megumin;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src $out/share/icons/Cursor
  '';
}
