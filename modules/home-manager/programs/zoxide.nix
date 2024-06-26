{ lib, config, ... }:
with lib; let cfg = config.programs.zoxide;
in
{
  options = {
    programs.zoxide.prefix = mkOption {
      type = types.str;
      description = "prefix to use for zoxide";
      default = "z";
      example = "cd";
    };
  };
  config = {
    programs.zoxide = {
      enable = mkDefault true;
      enableZshIntegration = mkDefault true;
      options = mkIf cfg.enableZshIntegration (mkDefault [ "--cmd ${cfg.prefix}" ]);
    };
  };
}
