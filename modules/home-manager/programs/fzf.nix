{lib, ...}: {
  programs.fzf = {
    enable = lib.mkDefault true;
    enableZshIntegration = lib.mkDefault true;
  };
}
