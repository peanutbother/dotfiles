{
  # sonoma: requires new groupid because of changes
  ids.gids.nixbld = 350;

  nix = {
    settings.sandbox = false;
    # enable garbage collection
    gc = {
      interval = {
        Weekday = 0;
        Hour = 0;
        Minute = 0;
      };
    };
  };

  imports = [
    ../common/nix
  ];
}
