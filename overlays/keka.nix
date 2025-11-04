inputs: final: prev: let
  fetchzip = inputs.nixpkgs.legacyPackages.${final.system}.fetchzip;
in {
  keka = prev.keka.overrideAttrs (_: prev: rec {
    version = "1.6.0";
    src = fetchzip {
      url = "https://github.com/aonez/Keka/releases/download/v${version}/Keka-${version}.zip";
      hash = "sha256-E0KvDgjx86myZk5+QsydonDaT31CS+B1QGOUXCOaJxY=";
    };
  });
}
