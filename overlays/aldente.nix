final: prev: {
  aldente = prev.aldente.overrideAttrs (_: prev: rec {
    version = "1.34.1";
    src = builtins.fetchurl {
      url = "https://github.com/davidwernhart/aldente-charge-limiter/releases/download/${version}/AlDente.dmg";
      sha256 = "sha256:1x9h8pw8d500g5r54agcl1l92wndsa1x9473xdz8qrbyfxi4h2c7";
    };
  });
}
