{ lib, ... }: {
  nix = {
    # TODO do not automatically hotlink duplicate files (currently broken)[https://github.com/NixOS/nix/issues/1281]
    settings.auto-optimise-store = lib.mkForce false;
    # cofigure nix to use build users
    configureBuildUsers = lib.mkDefault true;
    # enable garbage collection
    gc = {
      interval = {
        Weekday = 0;
        Hour = 0;
        Minute = 0;
      };
    };
  };
  # activate nix daemon
  services.nix-daemon.enable = lib.mkDefault true;

  imports = [
    ../common/nix.nix
  ];
}
