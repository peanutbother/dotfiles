{lib, ...}: {
  programs.eza = {
    enable = lib.mkDefault true;
  };
}
