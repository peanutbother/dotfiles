final: prev: {
  aldente = prev.aldente.overrideAttrs (_: prev: rec {
    version = "1.36.3";
    src = builtins.fetchurl {
      url = "https://github.com/davidwernhart/aldente-charge-limiter/releases/download/${version}/AlDente.dmg";
      sha256 = "sha256:1mw31mw06q8ibr63163nvwak5qy18i4i647a5f136i5ll8mqkda4";
    };
  });
}
