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
  };
}
