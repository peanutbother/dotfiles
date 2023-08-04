{
  programs.direnv = {
    enable = true;
    enableZshIntegration = true; # we add our own hook which only outputs loading / export / unloading

    nix-direnv.enable = true;

    config.global = {
      warn_timeout = "1m";
    };
  };
  programs.zsh.envExtra = ''
    export DIRENV_HIDE_DIFF=1;
  '';
  # programs.zsh.initExtra = ''
  #   eval "$(direnv hook zsh)"
  #   copy_function() {
  #     test -n "$(declare -f "$1")" || return 
  #     eval "${_/$1/$2}"
  #   }

  #   copy_function _direnv_hook _direnv_hook__old

  #   _direnv_hook() {
  #     _direnv_hook__old "$@" 2> >(egrep -v '^direnv: (export)')
  #   }
  # '';
}
