{ lib, config, ... }:
with lib; let
  mkURLConfig = host: shortcut: {
    # url rewrites to ssh
    "ssh://git@${host}".pushInsteadOf = "https://${host}";
    # url aliases
    "https://${host}".insteadOf = shortcut;
  };
  cfg = config.programs.git;
in
{
  options = {
    programs.git.shortcuts = mkOption {
      type = with types; attrsOf str;
      description = "creates url aliases for git sources";
      default = {
        "gh" = "github.com";
        "gl" = "gitlab.com";
      };
      example = {
        "gh" = "github.com";
        "gl" = "gitlab.com";
      };
    };
  };

  config = {
    programs.git =
      {
        enable = lib.mkDefault true;
        extraConfig = {
          init.defaultBranch = lib.mkDefault "main";

          pull.rebase = lib.mkDefault false;
          push.autoSetupRemote = lib.mkDefault true;

          url = (foldl (a: b: a // b) { } (
            mapAttrsToList (shortcut: host: mkURLConfig host shortcut) cfg.shortcuts
          ));
        };
      };
  };
}
