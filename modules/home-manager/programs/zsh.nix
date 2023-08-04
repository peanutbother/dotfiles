{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;

    autocd = true;
    envExtra = ''
      develop(){
        nix develop ~/.nix#$1 --show-trace
      }
    '';
  };
}
