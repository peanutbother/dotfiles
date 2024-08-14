final: prev: {
  keka = prev.keka.overrideAttrs (_: prev: rec {
    version = "1.4.3";
    src = builtins.fetchurl {
      url = "https://github.com/aonez/Keka/releases/download/v${version}/Keka-${version}.zip";
      sha256 = "sha256:0kimx252naa396y3z75492w44m3fpp4mvi7wcz4l12yvwxxgdj4d";
    };
  });
}
