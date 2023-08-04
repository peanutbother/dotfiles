{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
    shell = "${pkgs.zsh}/bin/zsh";
    shortcut = "y";
    terminal = "xterm-256color";
    plugins = with pkgs; [
      # tmuxPlugins.battery # currently broken
      # tmuxPlugins.cpu # needs fixup, see `extraConfig`
      tmuxPlugins.urlview
      tmuxPlugins.logging
      tmuxPlugins.prefix-highlight
    ];
    extraConfig = ''
      unbind r
      bind r source-file ~/.tmux.conf
      set -g status on
      set -g status-right '# #{cpu_percentage} '
      run-shell ${pkgs.tmuxPlugins.cpu}/share/tmux-plugins/cpu/cpu.tmux
      set-option -g status-position top
      set-option -g status-style fg=white,bg=black
    '';
  };
}
