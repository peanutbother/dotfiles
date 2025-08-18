{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  plugins = pkgs.callPackage ./plugins.nix {};
  cfg = config.programs.tmux;
  plgs = with pkgs.tmuxPlugins;
  with plugins; [
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

    # utilities
    tmux-fzf
    tmux-notify
    logging
  ];
in {
  options = {
    programs.tmux.urlview = mkOption {
      type = types.bool;
      description = "whether to enable urlview plugin";
      default = false; # disabled by default currently because it does not compile
    };
  };
  config = {
    programs.tmux = {
      enable = mkDefault true;
      clock24 = true;
      mouse = true;
      shell = "${pkgs.zsh}/bin/zsh";
      shortcut = mkDefault "y";
      terminal = "xterm-256color";
      plugins = mkDefault (
        if cfg.urlview
        then plgs ++ [pkgs.tmuxPlugins.urlview]
        else plgs
      );
      extraConfig = ''
        # Hack Terminfo to force 24 bit color support flags for my favourite terminal
        set-option -sa terminal-overrides ",xterm-*:Tc"
        set-option -sa terminal-overrides ",tmux-*:RGB"
        set-option -sa terminal-overrides ",alacritty:RGB"
        set-option -sa terminal-overrides ",rio:Tc"
        set-option -sa terminal-overrides ",screen-256color:Tc"

        # set status bar to top
        set-option -g status-position top

        bind S run-shell "tmux popup -E ${pkgs.cht-sh}/tmux.sh"

        # sending panes back and forth (https://unix.stackexchange.com/a/14301/220900)
        bind-key < command-prompt -p "join pane from:"  "join-pane -s '%%'"
        bind-key > command-prompt -p "send pane to:"  "join-pane -t '%%'"
      '';
    };
  };
}
