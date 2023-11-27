{ lib, ... }: {
  programs.alacritty = {
    enable = lib.mkDefault true;
    settings.font.normal.family = lib.mkDefault "FiraMono Nerd Font";
    settings.font.size = lib.mkDefault 16;
  };
}
