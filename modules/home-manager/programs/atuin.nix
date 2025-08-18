{
  lib,
  config,
  ...
}: {
  programs.atuin = {
    enable = lib.mkDefault true;
    enableZshIntegration = lib.mkDefault config.programs.zsh.enable;
    enableBashIntegration = lib.mkDefault config.programs.bash.enable;
    daemon.enable = lib.mkDefault true;
    settings = {
      enter_accept = lib.mkDefault true;
    };
  };
}
