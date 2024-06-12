{ lib, ... }: {
  system.defaults.".GlobalPreferences"."com.apple.mouse.scaling" = lib.mkDefault (-1.0); # disable mouse acceleration
}
