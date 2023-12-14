{ lib, pkgs, ... }: {
  fonts = {
    fontDir.enable = lib.mkDefault true; # DANGER
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
