{
  programs.git = {
    enable = true;
    userName = "peanutbother";
    userEmail = "peanutbother@proton.me";
    extraConfig = {
      init.defaultBranch = "main";

      pull.rebase = false;
      push.autoSetupRemote = true;

      # url rewrites to ssh
      url."ssh://git@github.com".pushInsteadOf = "https://github.com";
      url."ssh://git@gitlab.com".pushInsteadOf = "https://gitlab.com";

      # url aliases
      url."https://github.com/".insteadOf = "gh";
      url."https://gitlab.com/".insteadOf = "gl";
    };
  };
}
