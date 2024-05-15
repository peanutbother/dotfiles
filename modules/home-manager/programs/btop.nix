{ lib, ... }: {
  programs.btop = {
    enable = lib.mkDefault true;
  };
}
