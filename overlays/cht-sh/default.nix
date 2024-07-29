# adds `cht-sh` to nixpkgs
final: _: {
  cht-sh = final.callPackage ./pkg.nix {};
}
