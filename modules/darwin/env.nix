{pkgs, ...}: {
  environment = {
    shells = [pkgs.zsh];
    systemPackages = [pkgs.coreutils];
    systemPath = ["/usr/local/Homebrew/bin"];
    pathsToLink = ["/Applications"];
  };
}
