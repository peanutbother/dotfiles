{
  home,
  pkgs,
  repo,
  user,
  ...
}: {
  home-manager.users.${user} = {
    home = {
      packages = with pkgs; [
        dockdoor
        docker
        ffmpeg
        imagemagick
        istat-menus
        keka
        nix-auth
        nixd
        ntfs3g # required for mounty
        raycast
        rectangle
        utm
      ];

      sessionPath = [
        "${home}/.local/bin"
        "/opt/homebrew/bin"
      ];
      
    };

    programs = {
      git.settings = {
        user = {
          name = "peanutbother";
          email = "peanutbother@proton.me";
        };
      };

      yt-dlp.enable = false;
      vscode.enable = false;
      spicetify.enable = false;
      moonlight.enable = false;

      ssh = {
        settings = let
          lxcConfig = {
            IdentityFile = "~/.ssh/dev_lxc";
            User = "root";
          };
        in {
          "*".IdentityFile = [
            "~/.ssh/dev_bricksoft"
            "~/.ssh/dev_lxc"
            "~/.ssh/dev_pve"
            "~/.ssh/dev_ravpower"
            "~/.ssh/dev_yumac"
            "~/.ssh/dev_yudeck"
          ];
          "*.github.com".IdentityFile = "~/.ssh/github_peanutbother";
          "*.lab" = lxcConfig;
          "10.95.0.*" = lxcConfig;
        };
      };

      zoxide.prefix = "cd";
      zsh.initContent = ''
        source ~/.orbstack/shell/init.zsh 2>/dev/null || :
      '';
    };

    sops = {
      age.keyFile = "${repo}/secrets/keys.txt";
      secrets = {
        "ssh-keys/git/peanutbother" = {
          path = "${home}/.ssh/github_peanutbother";
        };
        "ssh-keys/devs/bricksoft" = {
          path = "${home}/.ssh/dev_bricksoft";
        };
        "ssh-keys/devs/lxc" = {
          path = "${home}/.ssh/dev_lxc";
          sopsFile = ../../secrets/YunAir.yaml;
        };
        "ssh-keys/devs/pve" = {
          path = "${home}/.ssh/dev_pve";
          sopsFile = ../../secrets/YunAir.yaml;
        };
        "ssh-keys/devs/ravpower" = {
          path = "${home}/.ssh/dev_ravpower";
        };
        "ssh-keys/devs/YunAir" = {
          path = "${home}/.ssh/dev_yunair";
          sopsFile = ../../secrets/YunAir.yaml;
        };
        "ssh-keys/devs/YuDeck" = {
          path = "${home}/.ssh/dev_yudeck";
          sopsFile = ../../secrets/YunAir.yaml;
        };
      };
    };
  };
}
