final: prev: let
  version = "7.66.0";
  hash = ""; # TODO supply signal hash for linux
in {
  signal-desktop-bin = prev.signal-desktop-bin.overrideAttrs (_: prev:
    if final.system != "aarch64-darwin" && final.system != "x86_64-darwin"
    then {
      inherit hash version;
    }
    else {
      src = builtins.fetchurl {
        url = "https://updates.signal.org/desktop/signal-desktop-mac-universal-${version}.dmg";
        sha256 = "sha256:03q9zd420y5lrn7si5jpi58w72jy7lb7xls14jgh1qh0h4j6gdgf";
      };
    });
}
