final: prev: {
  alt-tab-macos = prev.alt-tab-macos.overrideAttrs (_: prev: rec {
    version = "10.12.0";
    src = builtins.fetchurl {
      url = "https://github.com/lwouis/alt-tab-macos/releases/download/v${version}/AltTab-${version}.zip";
      sha256 = "sha256:051c36j3ha8iz5xfd2a0nxfvr2gk0gd51vx9nnkdnc6xy5fagbp7";
    };
  });
}
