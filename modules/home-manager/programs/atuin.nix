{lib, ...}: {
  programs.atuin = {
    enable = lib.mkDefault true;
    enableZshIntegration = lib.mkDefault true;
    daemon.enable = lib.mkDefault true;
    settings = {
      enter_accept = lib.mkDefault true;
    };
  };
}
