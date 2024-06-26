{ lib, config, ... }: {
  programs.direnv = {
    enable = lib.mkDefault true;
    enableZshIntegration = lib.mkDefault true;

    nix-direnv.enable = lib.mkDefault config.programs.direnv.enable;

    config.global = {
      warn_timeout = "1m";
    };
  };
  # hide env variable diffs of direnv
  programs.zsh.envExtra = lib.mkIf config.programs.direnv.enable ''
    export DIRENV_HIDE_DIFF=1;
  '';
}
