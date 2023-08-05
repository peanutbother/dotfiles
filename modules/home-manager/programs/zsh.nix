{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;

    autocd = true;
    envExtra = ''
      # initialize nix development shells with this alias
      develop(){
        nix develop ~/.nix#$1 --show-trace
      }
    '';
  };
}
