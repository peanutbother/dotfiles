{ config, ... }: {
  home.file = {
    ".cargo" = {
      source = ./cargo;
      recursive = true;
    };
    ".config/tmux" = {
      source = ./tmux;
      recursive = true;
    };
    ".config/tmuxinator" = {
      source = ./tmuxinator;
      recursive = true;
    };
    ".ssh" = {
      source = ./ssh;
      recursive = true;
    };
  };
}
