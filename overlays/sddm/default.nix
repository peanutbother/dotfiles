# adds `MacVentura` sddm theme to nixpkgs
final: prev: {
  sddm-macventura-theme = final.callPackage ./pkg.nix {};
}
