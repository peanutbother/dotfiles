{ lib, ... }: {
  programs.ssh = {
    enable = true;

    # extraConfig = lib.mkDefault ''
    #   Host *.github.com
    #     AddKeysToAgent yes
    #     UseKeychain yes
    #     IdentityFile ~/.ssh/github_peanutbother
    # '';
  };
}
