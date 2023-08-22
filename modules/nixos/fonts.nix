{ pkgs, ... }: {
  fonts = {
    fontDir.enable = true; # DANGER
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
