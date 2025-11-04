final: prev: {
  aldente = prev.aldente.overrideAttrs (_: prev: rec {
    version = "1.35.1";
    src = builtins.fetchurl {
      url = "https://github.com/davidwernhart/aldente-charge-limiter/releases/download/${version}/AlDente.dmg";
      sha256 = "sha256:0iz1fsw16mj66kqy7i1zv35fbj3dxbgvx959fjvv4n98v17s6dis";
    };
  });
}
