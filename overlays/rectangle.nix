final: prev: {
  rectangle = prev.rectangle.overrideAttrs (_: prev: rec {
    version = "0.89";
    src = builtins.fetchurl {
      url = "https://github.com/rxhanson/Rectangle/releases/download/v${version}/Rectangle${version}.dmg";
      sha256 = "sha256:0k8dbg3d5hxd9264pi42l5cg4rhsd3m2kl92djq151y9f3xc53bq";
    };
  });
}
