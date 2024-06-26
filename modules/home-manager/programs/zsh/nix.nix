{ config, ... }: {
  programs.zsh = {
    envExtra = ''
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
    '';
  };
}
