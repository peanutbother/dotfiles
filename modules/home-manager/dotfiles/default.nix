{ config, ... }: {
  home.file = {
    ".cargo/config".source = ./cargo/config;
    ".config/tmux/tmux-nerd-font-window-name.yml".source = ./tmux/tmux-nerd-font-window-name.yml;
    ".ssh/dev_bricksoft.pub".source = ./ssh/dev_bricksoft.pub;
    ".ssh/dev_ravpower.pub".source = ./ssh/dev_ravpower.pub;
    ".ssh/github_peanutbother.pub".source = ./ssh/github_peanutbother.pub;
  };
}
