final: prev: {
  aldente = prev.aldente.overrideAttrs (_: prev: rec {
    version = "1.37.3";
    src = builtins.fetchurl {
      url = "https://github.com/davidwernhart/aldente-charge-limiter/releases/download/${version}/AlDente.dmg";
      sha256 = "sha256:1vmxd2j1b526kwc2wv9xqs144lcdphr8vim3x7j10cqx3z0w52j6";
    };
  });
}
