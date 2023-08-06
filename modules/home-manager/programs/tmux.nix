{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
    shell = "${pkgs.zsh}/bin/zsh";
    shortcut = "y";
    terminal = "xterm-256color";
    plugins = with pkgs.tmuxPlugins; [
      logging
      pain-control
      prefix-highlight
      tmux-colors-solarized
      urlview
    ];
    extraConfig = ''
      # Hack Terminfo to force 24 bit color support flags for my favority terminal(s)
      set-option -sa terminal-overrides ",xterm-256color:Tc"
      set-option -sa terminal-overrides ",tmux-256color:RGB"
      set-option -sa terminal-overrides ",alacritty:RGB"

      # hot reload tmux config 
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf

      set -g status on

      # set status bar to top
      set-option -g status-position top

      # show prefix, cpu & battery usage 
      set -g status-right '#{prefix_highlight}  #{cpu_percentage} 󱐋 #{battery_percentage} '

      # set prefix-highlight color to solarized color scheme
      set -g @prefix_highlight_bg colour136

      # load status plugins after to fix display
      run-shell ${pkgs.tmuxPlugins.prefix-highlight}/share/tmux-plugins/prefix-highlight/prefix_highlight.tmux
      run-shell ${pkgs.tmuxPlugins.cpu}/share/tmux-plugins/cpu/cpu.tmux
      run-shell ${pkgs.tmuxPlugins.battery}/share/tmux-plugins/battery/battery.tmux
    '';
  };
}
