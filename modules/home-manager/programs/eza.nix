{ lib, ... }: {
  programs.eza = {
    enable = lib.mkDefault true;
    enableAliases = lib.mkDefault true;
  };
}
