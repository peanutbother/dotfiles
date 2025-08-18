{
  lib,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = lib.mkDefault true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    autocd = true;

    initContent = lib.mkIf (pkgs.stdenv.hostPlatform.isAarch64 && pkgs.stdenv.hostPlatform.isDarwin) ''
      # make sure brew is on the path for aarch64
      eval "$(/opt/homebrew/bin/brew shellenv)"
    '';

    plugins = pkgs.callPackage ./plugins.nix {};
  };

  imports = [
    ./nix.nix
  ];
}
