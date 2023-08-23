{
  programs.git =
    let
      gh = "github.com";
      gl = "gitlab.com";
      mkURLConfig = host: shortcut: {
        # url rewrites to ssh
        "ssh://git@${host}".pushInsteadOf = "https://${host}";
        # url aliases
        "https://${host}".insteadOf = shortcut;
      };
    in
    {
      enable = true;
      userName = "peanutbother";
      userEmail = "peanutbother@proton.me";
      extraConfig = {
        init.defaultBranch = "main";

        pull.rebase = false;
        push.autoSetupRemote = true;

        url = { }
          // mkURLConfig gh "gh"
          // mkURLConfig gl "gl";
      };
    };
}
