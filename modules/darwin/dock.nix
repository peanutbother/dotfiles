{lib, ...}: {
  system.defaults.dock = {
    autohide = lib.mkDefault true;
    magnification = lib.mkDefault false; # don't magnify on hover
    tilesize = lib.mkDefault 42; # dock icon size
    wvous-tl-corner = lib.mkDefault 11; # launchpad as hot corner top left
  };
}
