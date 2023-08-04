{
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;

    nix-direnv.enable = true;

    config.global = {
      warn_timeout = "1m";
    };
  };
  # hide env variable diffs of direnv
  programs.zsh.envExtra = ''
    export DIRENV_HIDE_DIFF=1;
  '';
}
