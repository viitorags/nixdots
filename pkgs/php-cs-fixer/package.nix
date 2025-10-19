{
  lib,
  fetchurl,
  stdenv,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "php-cs-fixer";
  version = "3.85.1";

  src = fetchurl {
    url = "https://github.com/PHP-CS-Fixer/PHP-CS-Fixer/releases/download/v${finalAttrs.version}/php-cs-fixer.phar";
    hash = "sha256-0DcVH2dmBe/4Sqc2QkXLEEM9jPvLC3N9HOQVDad3vZw=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/php-cs-fixer
    chmod +x $out/bin/php-cs-fixer
  '';

  meta = {
    description = "A tool to automatically fix PHP coding standards issues";
    homepage = "https://github.com/PHP-CS-Fixer/PHP-CS-Fixer";
    license = lib.licenses.mit;
    platforms = lib.platforms.all;
  };
})
