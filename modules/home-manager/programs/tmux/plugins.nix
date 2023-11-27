{ lib, pkgs, ... }:
let
  inherit (lib) makeBinPath;
  inherit (pkgs) makeWrapper fetchFromGitHub;
  inherit (pkgs.tmuxPlugins) mkTmuxPlugin;
in
{
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
  tmux-nerd-font-window-name-show-name = mkTmuxPlugin {
    pluginName = "tmux-nerd-font-window-name-show-name";
    version = "1.2.2";
    rtpFilePath = "tmux-nerd-font-window-name.tmux";
    src = fetchFromGitHub {
      owner = "joshmedeski";
      repo = "tmux-nerd-font-window-name";
      rev = "83c572451a969a8741c4c608f3d99d82814ac2d8";
      hash = "sha256-2JBdKVdHU5WvA2DtK4JXY8xKjvGF17pR/nylU8gmDnM=";
    };
    nativeBuildInputs = [ makeWrapper ];
    postInstall = ''
      wrapProgram $target/bin/tmux-nerd-font-window-name --prefix PATH : ${with pkgs; makeBinPath [yq-go ]}
    '';
  };
}
