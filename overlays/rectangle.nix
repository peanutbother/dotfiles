final: prev: {
  rectangle = prev.rectangle.overrideAttrs (_: prev: rec {
    version = "0.94";
    src = builtins.fetchurl {
      url = "https://github.com/rxhanson/Rectangle/releases/download/v${version}/Rectangle${version}.dmg";
      sha256 = "sha256:053ps3by24ysxn6ppzcay6l20j1ix3m081i038p6zdbxxqr3xqsx";
    };
  });
}
