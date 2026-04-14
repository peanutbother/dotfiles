final: prev: let
  version = "8.6.0";
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
        sha256 = "sha256:1rw375zqqr2g6p9nk9nqmfsks4k8321vj9f8d8b002m5l1vr9frj";
      };
    });
}
