{ lib, ... }: {
  # Set your time zone.
  time.timeZone = lib.mkDefault "Europe/Berlin";
}
