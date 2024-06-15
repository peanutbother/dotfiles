{ lib, pkgs, ... }: {
  programs.zsh = {
    enable = lib.mkDefault true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;

    autocd = true;
    envExtra = ''
      setopt extended_glob
      
      # initialize nix development shells with these aliases
      develop(){
        nix develop ~/.nix#$1 --show-trace
      }
      develop_init(){
        nix flake init --template $1 --show-trace && direnv allow
      }
      develop_create(){
        nix flake new --template $1 $2 --show-trace && direnv allow
      }

      # Download given URL as mp3 via youtube-dl into ~/Downloads
      yta(){
        yt-dlp -i -c -o "~/Downloads/%(title)s-%(id)s.%(ext)s" --extract-audio --audio-format mp3 --audio-quality 0 "$1"
      }
      # Download given URL as best single file video quality resolution via youtube-dl into ~/Downloads
      ytv(){
        yt-dlp "$1" -o "~/Downloads/%(title)s-%(id)s.%(ext)s" 
      }
    '';
    initExtra =
      if pkgs.stdenv.hostPlatform.isAarch64 then ''
        #make sure brew is on the path for aarch64
          eval "$(/opt/homebrew/bin/brew shellenv)"
      '' else "";
  };
}
