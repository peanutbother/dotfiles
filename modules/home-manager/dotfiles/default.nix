{
  config,
  lib,
  ...
}: {
  home.file = {
    ".cargo" = {
      source = ./cargo;
      recursive = true;
    };
    ".config/tmux" = lib.mkIf config.programs.tmux.enable {
      source = ./tmux;
      recursive = true;
    };
    ".config/tmuxinator" = lib.mkIf config.programs.tmux.enable {
      source = ./tmuxinator;
      recursive = true;
    };
    ".config/direnv" = lib.mkIf config.programs.direnv.enable {
      source = ./direnv;
      recursive = true;
    };
    ".ssh" = lib.mkIf config.programs.ssh.dotfiles {
      source = ./ssh;
      recursive = true;
    };
  };
}
