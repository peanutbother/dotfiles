{
  lib,
  config,
  ...
}: let
  cfg = config.programs.ssh;
in {
  options = {
    programs.ssh.dotfiles = with lib;
      mkOption {
        type = types.bool;
        description = "whether to copy dotfiles to .ssh";
        default = true;
        example = false;
      };
  };
  config = {
    programs.ssh = {
      enable = lib.mkDefault true;
    };
  };
}
