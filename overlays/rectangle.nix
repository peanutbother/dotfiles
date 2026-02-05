final: prev: {
  rectangle = prev.rectangle.overrideAttrs (_: prev: rec {
    version = "0.93";
    src = builtins.fetchurl {
      url = "https://github.com/rxhanson/Rectangle/releases/download/v${version}/Rectangle${version}.dmg";
      sha256 = "sha256:0xla557mfnanawilgmkffjs7pzr34mc9bqncfcgx8yrzdx91g244";
    };
  });
}
