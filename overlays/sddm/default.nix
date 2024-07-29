# adds `MacVentura` sddm theme to nixpkgs
final: _: {
  sddm-macventura-theme = final.callPackage ./pkg.nix {};
}
