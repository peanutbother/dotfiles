{ lib, ... }: {
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
      enable = lib.mkDefault true;
      extraConfig = {
        init.defaultBranch = lib.mkDefault "main";

        pull.rebase = lib.mkDefault false;
        push.autoSetupRemote = lib.mkDefault true;

        url = { }
          // mkURLConfig gh "gh"
          // mkURLConfig gl "gl";
      };
    };
}
