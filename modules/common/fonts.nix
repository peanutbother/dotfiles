{
  lib,
  pkgs,
  ...
}: {
  fonts = {
    packages = lib.mkDefault [
      (pkgs.nerdfonts.override {
        fonts = [
          "FiraCode"
          "FiraMono"
        ];
      })
    ];
  };
}
