final: prev: let
  version = "7.83.0";
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
        sha256 = "sha256:072xsh1p9ssskfclcbvmsfgmfiq159909iv0rvdy7ryk733z8vp5";
      };
    });
}
