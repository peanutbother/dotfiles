{ lib, ... }: {
  programs.ssh = {
    enable = lib.mkDefault true;
  };
}
