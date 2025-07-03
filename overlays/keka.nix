final: prev: {
  keka = prev.keka.overrideAttrs (_: prev: rec {
    version = "1.5.2";
    src = builtins.fetchurl {
      url = "https://github.com/aonez/Keka/releases/download/v${version}/Keka-${version}.zip";
      sha256 = "sha256:1drimcwd3s9rvgcssdlz3cyalxqx2y25cl2ayjiwvfwpsd5rzib6";
    };
  });
}
