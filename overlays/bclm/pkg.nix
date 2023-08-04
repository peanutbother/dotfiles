{ lib, fetchFromGitHub, fetchzip, stdenv, swift }: stdenv.mkDerivation rec {
  pname = "bclm";
  version = "0.0.4";

  meta = with lib; {
    description = "macOS command-line utility to limit max battery charge";
    homepage = "https://github.com/zackelia/bclm";
    license = licenses.mit;
    platforms = platforms.darwin;
    maintainers = [ "zackelia" "nata1993" ];
  };


  src = fetchzip {
    url = "https://github.com/zackelia/bclm/releases/download/v${version}/bclm.zip";
    hash = "sha256-3sQhszO+MRLGF5/dm1mFXQZu/MxK3nw68HTpc3cEBOA=";
  };

  installPhase = ''
    mkdir --parents "$out/bin"
    cp ./bclm "$out/bin"
  '';
}
