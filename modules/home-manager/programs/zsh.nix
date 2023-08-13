{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;

    autocd = true;
    envExtra = ''
      # initialize nix development shells with these aliases
      develop(){
        nix develop ~/.nix#$1 --show-trace
      }
      init_develop(){
        nix flake init --template $1 --show-trace && direnv allow
      }
      create_develop(){
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
  };
}
