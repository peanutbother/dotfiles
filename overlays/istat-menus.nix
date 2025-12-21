inputs: final: prev: let
  fetchurl = inputs.nixpkgs.legacyPackages.${final.system}.fetchurl;
  lib = inputs.nixpkgs.lib;
in {
  istat-menus = prev.istat-menus.overrideAttrs (_: prev: rec {
    version = "7.20";
    src = fetchurl {
      url = "https://cdn.istatmenus.app/files/istatmenus${lib.versions.major version}/versions/iStatMenus${version}.zip";
      hash = "sha256-oJApYp7ejtcMrm7CyeohV/euXYkJJ0yCRBW2i5AgcEE=";
    };
  });
}
