{ pkgs, ... }:
let
  fetchFromGitHub = pkgs.fetchFromGitHub;
  mkTmuxPlugin = pkgs.tmuxPlugins.mkTmuxPlugin;

  tmux-notify = mkTmuxPlugin {
    pluginName = "tmux-notify";
    version = "2.1.0";
    rtpFilePath = "tnotify.tmux";
    src = fetchFromGitHub {
      owner = "rickstaa";
      repo = "tmux-notify";
      rev = "6f965c291358c15ed1d38ba18d10a630325ee75f";
      hash = "sha256-nfhHR1Nwlfy+Hsqal2p8szrD2IQ1kPqQxZYK8stFrxA=";
    };
  };
in
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
    shell = "${pkgs.zsh}/bin/zsh";
    shortcut = "y";
    terminal = "xterm-256color";
    plugins = with pkgs.tmuxPlugins; [
      better-mouse-mode
      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavour 'macchiato'
          set -g @catppuccin_pill_theme_enabled on
          set -g @catppuccin_window_tabs_enabled on
          set -g @catppuccin_host "on"
        '';
      }
      logging
      pain-control
      {
        plugin = prefix-highlight;
        extraConfig = ''
          # set prefix-highlight color to solarized color scheme
          set -g @prefix_highlight_bg colour136
        '';
      }
      tmux-notify
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

      # set status bar to top
      set-option -g status-position top

      bind S run-shell "tmux popup -y 10 -w 100 -h 20 -E ${pkgs.cht-sh}/tmux.sh"
    '';
  };
}
