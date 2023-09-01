# adds `mac` plymouth theme to nixpkgs

final: prev:
{
  plymouth-mac-theme = final.callPackage ./themes/mac.nix { };
}
