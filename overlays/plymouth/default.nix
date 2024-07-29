# adds `mac` plymouth theme to nixpkgs
final: _: {
  plymouth-mac-theme = final.callPackage ./themes/mac.nix {};
}
