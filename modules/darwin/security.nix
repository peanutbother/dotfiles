{ lib, config, pkgs, ... }:
let cfg = config.security; in
{
  options = {
    security.useTouchId = lib.mkOption {
      type = lib.types.bool;
      description = "whether to enable touchid in sudo prompts";
      default = true;
      example = false;
    };
  };
  config = {
    security.pam.enableSudoTouchIdAuth = lib.mkDefault cfg.useTouchId;
    security.sudo.extraConfig = lib.mkDefault (if cfg.useTouchId then "auth       optional       ${pkgs.unstable.pam-reattach}/lib/pam/pam_reattach.so" else "");
  };
}
