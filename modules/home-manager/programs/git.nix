{
  programs.git = {
    enable = true;
    userName = "peanutbother";
    userEmail = "peanutbother@proton.me";
    extraConfig = {
      init.defaultBranch = "main";

      pull.rebase = false;
      push.autoSetupRemote = true;

      url."ssh://git@github.com".pushInsteadOf = "https://github.com";
      url."ssh://git@gitlab.com".pushInsteadOf = "https://gitlab.com";
    };
  };
}
