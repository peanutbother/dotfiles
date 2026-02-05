final: prev: let
  version = "7.85.0";
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
        sha256 = "sha256:0jmnqxyiihab7sa5vc75m4r1msaynk1862q53w6kx9mgahr7hyx1";
      };
    });
}
