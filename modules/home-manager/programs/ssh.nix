{lib, ...}: {
  options = {
    programs.ssh.dotfiles = with lib;
      mkOption {
        type = types.bool;
        description = "whether to copy dotfiles to .ssh";
        default = true;
        example = false;
      };
  };
  config = {
    programs.ssh = {
      enable = lib.mkDefault true;
      settings."*" = {
        AddKeysToAgent = lib.mkDefault true;
        ForwardAgent = lib.mkDefault true;
        HashKnownHosts = lib.mkDefault true;
        IgnoreUnknown = lib.mkDefault "UseKeychain";
        UserKnownHostsFile = lib.mkDefault "~/.ssh/known_hosts";
        UseKeychain = lib.mkDefault true;
      };
      enableDefaultConfig = false;
    };
  };
}
