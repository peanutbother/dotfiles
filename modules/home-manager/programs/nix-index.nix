{
  lib,
  config,
  ...
}: {
  programs.nix-index = {
    enable = lib.mkDefault true;
    enableZshIntegration = lib.mkDefault config.programs.zsh.enable;
    enableBashIntegration = lib.mkDefault config.programs.bash.enable;
  };
}
