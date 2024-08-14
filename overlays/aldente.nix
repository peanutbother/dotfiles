final: prev: {
  aldente = prev.aldente.overrideAttrs (_: prev: rec {
    version = "1.27.3";
    src = builtins.fetchurl {
      url = "https://github.com/davidwernhart/aldente-charge-limiter/releases/download/${version}/AlDente.dmg";
      sha256 = "sha256:0lp8690rjjlvx0jahkw9jwli7np9jj1b7r3lzr35a4sb5mzsk8hv";
    };
  });
}
