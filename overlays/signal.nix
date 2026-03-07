final: prev: let
  version = "8.1.0";
in {
  signal-desktop-bin = prev.signal-desktop-bin.overrideAttrs (_: prev:
    if final.system != "aarch64-darwin" && final.system != "x86_64-darwin"
    then {
      inherit version;
      hash = ""; # TODO supply signal hash for linux
    }
    else {
      inherit version;
      src = builtins.fetchurl {
        url = "https://updates.signal.org/desktop/signal-desktop-mac-universal-${version}.dmg";
        sha256 = "sha256:168kiq8wvq0400xwfjdj044lmrd7wsdva9rf9s5qm2lqyzk2siak";
      };
    });
}
