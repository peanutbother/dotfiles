final: prev: let
  version = "7.77.1";
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
        sha256 = "sha256:1v6ps177w4zs40ka3y6gqajnsh2sgvq8vrsi6aa34yfxlkj52wxy";
      };
    });
}
