{ lib, pkgs, ... }: {
  fonts = {
    packages = [
      (pkgs.nerdfonts.override {
        fonts = [
          "FiraCode"
          "FiraMono"
        ];
      })
    ];
  };
}
