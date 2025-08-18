{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.security;
in {
  options = {
    security.useTouchId = lib.mkOption {
      type = lib.types.bool;
      description = "whether to enable touchid in sudo prompts";
      default = true;
      example = false;
    };
  };
  config = {
    security.pam.services.sudo_local.touchIdAuth = lib.mkDefault cfg.useTouchId;
    environment.etc."pam.d/sudo_local".text = lib.mkIf cfg.useTouchId ''
      # Written by nix-darwin
      auth       optional       ${pkgs.pam-reattach}/lib/pam/pam_reattach.so
      auth       sufficient     pam_tid.so
    '';
  };
}
