# adds `bclm` to nixpkgs
final: _: {
  bclm = final.callPackage ./pkg.nix {};
}
