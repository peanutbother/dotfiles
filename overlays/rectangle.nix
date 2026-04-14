final: prev: {
  rectangle = prev.rectangle.overrideAttrs (_: prev: rec {
    version = "0.95";
    src = builtins.fetchurl {
      url = "https://github.com/rxhanson/Rectangle/releases/download/v${version}/Rectangle${version}.dmg";
      sha256 = "sha256:0010l679qihfpdig8qb40njl1n1avj55np093j0qpih6f20i4abz";
    };
  });
}
