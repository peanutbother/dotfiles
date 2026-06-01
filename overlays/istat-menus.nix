inputs: final: prev: let
  fetchurl = inputs.nixpkgs.legacyPackages.${final.system}.fetchurl;
  lib = inputs.nixpkgs.lib;
in {
  istat-menus = prev.istat-menus.overrideAttrs (_: prev: rec {
    version = "7.30";
    src = fetchurl {
      url = "https://cdn.istatmenus.app/files/istatmenus${lib.versions.major version}/versions/iStatMenus${version}.zip";
      hash = "sha256-qCgMEUjHUsEP+B+e2nylse9T/Xnt765RzV0WtBSWSPY=";
    };
  });
}
