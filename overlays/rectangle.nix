final: prev: {
  rectangle = prev.rectangle.overrideAttrs (_: prev: rec {
    version = "0.88";
    src = builtins.fetchurl {
      url = "https://github.com/rxhanson/Rectangle/releases/download/v${version}/Rectangle${version}.dmg";
      sha256 = "sha256:0ixmx088p1kqixl3skdiszvwd67mmk9nwwby16s0z67yr6xyfav3";
    };
  });
}
