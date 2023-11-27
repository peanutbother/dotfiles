{ lib, pkgs, ... }: {
  fonts = {
    fontDir.enable = lib.mkDefault true; # DANGER
    fonts = [
      (pkgs.nerdfonts.override {
        fonts = [
          "FiraCode"
          "FiraMono"
        ];
      })
    ];
  };
}
