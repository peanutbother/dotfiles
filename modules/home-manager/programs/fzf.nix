{ lib, ... }: {
  programs.fzf = {
    enable = true;
    enableZshIntegration = lib.mkDefault true;
  };
}
