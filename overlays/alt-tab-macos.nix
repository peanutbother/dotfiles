final: prev: {
  alt-tab-macos = prev.alt-tab-macos.overrideAttrs (_: prev: rec {
    version = "8.0.0";
    src = builtins.fetchurl {
      url = "https://github.com/lwouis/alt-tab-macos/releases/download/v${version}/AltTab-${version}.zip";
      sha256 = "sha256:1dpwb0dk2rjs1g02y58nc7y9xnbb86pq1zhsbd0p72daz5ikjs2n";
    };
  });
}
