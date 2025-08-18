{
  lib,
  config,
  ...
}: {
  programs.direnv = {
    enable = lib.mkDefault true;
    enableZshIntegration = lib.mkDefault config.programs.zsh.enable;
    enableBashIntegration = lib.mkDefault config.programs.bash.enable;

    nix-direnv.enable = lib.mkDefault config.programs.direnv.enable;

    config.global = {
      warn_timeout = "1m";
    };
  };
  # hide env variable diffs of direnv
  programs.zsh.envExtra = lib.mkIf config.programs.zsh.enable ''
    export DIRENV_HIDE_DIFF=1;
  '';
}
