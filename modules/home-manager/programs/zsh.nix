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
    '';
  };
}
