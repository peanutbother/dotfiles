{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    programs.comma.enable = lib.mkOption {
      type = lib.types.bool;
      description = "whether to enable comma";
      default = true;
      example = false;
    };
  };
  config = {
    home.packages = lib.mkIf config.programs.comma.enable [pkgs.comma];
  };
}
