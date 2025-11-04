final: prev: {
  rectangle = prev.rectangle.overrideAttrs (_: prev: rec {
    version = "0.92";
    src = builtins.fetchurl {
      url = "https://github.com/rxhanson/Rectangle/releases/download/v${version}/Rectangle${version}.dmg";
      sha256 = "sha256:d18bf60eba0dbe4d94d7b539bf3ae17c472bf71015a55d22bc55480ef888d75b";
    };
  });
}
