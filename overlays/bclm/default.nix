# adds `bclm` to nixpkgs

final: prev:
{
  bclm = final.callPackage ./pkg.nix { };
}
