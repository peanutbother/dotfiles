# adds `cht-sh` to nixpkgs
final: _: {
  dockdoor = final.callPackage ./pkg.nix {};
}
