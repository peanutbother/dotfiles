{
  lib,
  pkgs,
  ...
}: {
  fonts.packages = with pkgs.nerd-fonts;
    lib.mkDefault [
      fira-code
      fira-mono
    ];
}
