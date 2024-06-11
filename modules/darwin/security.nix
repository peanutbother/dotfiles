{ lib, ... }: {
  security.pam.enableSudoTouchIdAuth = lib.mkDefault true;
}
