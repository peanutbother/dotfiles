final: prev: {
  ice-bar = prev.ice-bar.overrideAttrs (_: prev: rec {
    version = "0.11.12";
    src = builtins.fetchurl {
      url = "https://github.com/jordanbaird/Ice/releases/download/${version}/Ice.zip";
      sha256 = "sha256:13DoFZdWbdLSNj/rNQ+AjHqS42PflcUeSBQOsw5FLMk=";
    };
  });
}
