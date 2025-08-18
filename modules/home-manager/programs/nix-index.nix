{lib, ...}: {
  programs.nix-index = {
    enable = lib.mkDefault true;
    enableZshIntegration = lib.mkDefault true;
  };
}
