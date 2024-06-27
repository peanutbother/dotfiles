{
  lib,
  pkgs,
  ...
}: {
  environment = {
    shells = [pkgs.zsh];
    loginShell = lib.mkDefault pkgs.zsh;
    systemPackages = [pkgs.coreutils];
    systemPath = ["/usr/local/Homebrew/bin"];
    pathsToLink = ["/Applications"];
  };
}
