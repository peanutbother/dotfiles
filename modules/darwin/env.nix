{ pkgs, ... }: {
  environment = {
    shells = [ pkgs.zsh ];
    loginShell = pkgs.zsh;
    systemPackages = [ pkgs.coreutils ];
    systemPath = [ "/usr/local/Homebrew/bin" ];
    pathsToLink = [ "/Applications" ];
  };
}
