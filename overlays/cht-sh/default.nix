# adds `cht-sh` to nixpkgs

final: prev:
{
  cht-sh = final.callPackage ./pkg.nix { };
}
