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
    };
    programs.ssh.matchBlocks."*" = {
      # forwardAgent = lib.mkDefault false;
      # addKeysToAgent = lib.mkDefault "yes";
      # compression = lib.mkDefault true;
      # serverAliveInterval = lib.mkDefault 0;
      # serverAliveCountMax = lib.mkDefault 3;
      # hashKnownHosts = lib.mkDefault true;
      # userKnownHostsFile = lib.mkDefault "~/.ssh/known_hosts";
      # controlMaster = lib.mkDefault "no";
      # controlPath = lib.mkDefault "~/.ssh/master-%r@%n:%p";
      # controlPersist = lib.mkDefault "no";
    };
  };
}
