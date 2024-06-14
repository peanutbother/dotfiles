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
    environment.etc."pam.d/sudo_local".text = (if cfg.useTouchId then ''
      # Written by nix-darwin
      auth       optional       ${pkgs.unstable.pam-reattach}/lib/pam/pam_reattach.so
      auth       sufficient     pam_tid.so
    '' else "");
  };
}
