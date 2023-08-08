{
  programs.ssh = {
    enable = true;

    extraConfig = ''
      Host *.github.com
        AddKeysToAgent yes
        UseKeychain yes
        IdentityFile ~/.ssh/github_peanutbother
    '';
  };
}
