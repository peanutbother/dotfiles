final: prev: {
  alt-tab-macos = prev.alt-tab-macos.overrideAttrs (_: prev: rec {
    version = "7.38.1";
    src = builtins.fetchurl {
      url = "https://github.com/lwouis/alt-tab-macos/releases/download/v${version}/AltTab-${version}.zip";
      sha256 = "sha256:13bp767xb6knafmi74xlkih2y6spgp8q5xfa4ns9hmhxhs2dy3kb";
    };
  });
}
