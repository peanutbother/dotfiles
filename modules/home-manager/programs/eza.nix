{ lib, ... }: {
  programs.eza = {
    enable = lib.mkDefault true;
    enableAliases = true;
  };
}
