final: prev: {
  aldente = prev.aldente.overrideAttrs (_: prev: rec {
    version = "1.36.2";
    src = builtins.fetchurl {
      url = "https://github.com/davidwernhart/aldente-charge-limiter/releases/download/${version}/AlDente.dmg";
      sha256 = "sha256:0dzxs9pvxsrgs6sk359ikz7rmlg2qwk0z18038hsghdvscw49qsm";
    };
  });
}
