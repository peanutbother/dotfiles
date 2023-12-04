{ lib, fetchzip, stdenv }: stdenv.mkDerivation rec {
  pname = "bclm";
  version = "0.1.0";
  hash = "sha256-GtMxg8BnaJjfZ13G+/tzBiM0V/ZGze+RCEaimHdc550=";

  meta = with lib; {
    description = "macOS command-line utility to limit max battery charge";
    homepage = "https://github.com/zackelia/bclm";
    license = licenses.mit;
    platforms = platforms.darwin;
    maintainers = [ "peanutbother" ];
  };


  src = fetchzip {
    inherit hash;
    url = "https://github.com/zackelia/bclm/releases/download/v${version}/bclm.zip";
  };

  installPhase = ''
    mkdir --parents "$out/bin"
    cp ./bclm "$out/bin"
  '';
}
