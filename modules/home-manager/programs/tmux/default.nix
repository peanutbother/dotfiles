{ pkgs, ... }:
let
  plugins = pkgs.callPackage ./plugins.nix { };
in
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
    shell = "${pkgs.zsh}/bin/zsh";
    shortcut = "y";
    terminal = "xterm-256color";
    plugins = with pkgs.tmuxPlugins;with plugins; [
      # theme
      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavour 'macchiato'
          set -g @catppuccin_pill_theme_enabled on
          set -g @catppuccin_window_tabs_enabled on
          set -g @catppuccin_host "on"
        '';
      }
      # shell
      tmux-nerd-font-window-name-show-name

      # control
      better-mouse-mode
      pain-control
      urlview

      # utilities
      tmux-fzf
      tmux-notify
      logging
    ];
    extraConfig = ''
      # Hack Terminfo to force 24 bit color support flags for my favourite terminal
      set-option -sa terminal-overrides ",xterm-*:Tc"
      set-option -sa terminal-overrides ",tmux-*:RGB"
      set-option -sa terminal-overrides ",alacritty:RGB"

      # set status bar to top
      set-option -g status-position top

      bind S run-shell "tmux popup -y 10 -w 100 -h 50 -E ${pkgs.cht-sh}/tmux.sh"

      # sending panes back and forth (https://unix.stackexchange.com/a/14301/220900)
      bind-key < command-prompt -p "join pane from:"  "join-pane -s '%%'"
      bind-key > command-prompt -p "send pane to:"  "join-pane -t '%%'"
    '';
  };
}
