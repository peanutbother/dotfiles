final: prev: {
  alt-tab-macos = prev.alt-tab-macos.overrideAttrs (_: prev: rec {
    version = "10.4.0";
    src = builtins.fetchurl {
      url = "https://github.com/lwouis/alt-tab-macos/releases/download/v${version}/AltTab-${version}.zip";
      sha256 = "sha256:0zvg1wgi1ww31vihasrs2bjpmcl87krkgjw53bz66v04kn5r1dq9";
    };
  });
}
