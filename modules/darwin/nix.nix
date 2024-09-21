{lib, ...}: {
  # sonoma: requires new groupid because of changes
  ids.gids.nixbld = 350;
  
  nix = {
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
    ../common/nix
  ];
}
