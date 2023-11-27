{ home }: { pkgs, ... }:
let
  user = "yuna";
in
{
  home-manager.users.${user} = {
    home = {
      file = {
        ".ssh" = {
          source = ../../modules/home-manager/dotfiles/ssh;
          recursive = true;
        };
      };
      shellAliases = {
        nixswitch = "nix run nix-darwin -- switch --flake /Volumes/Share/.nix/.#"; # refresh nix env after config changes
        code = "env VSCODE_CWD=\"$PWD\" open -n -b \"com.microsoft.VSCode\" --args $*"; # create a shell alias for vs code
      };

      sessionPath = [
        "$HOME/.spicetify" # TODO needs to be manually installed as of now (spicetify-nix is incompatible with darwin)
      ];

      packages = with pkgs;[
        bclm
        imagemagick
      ];
    };

    programs.git = {
      userName = "peanutbother";
      userEmail = "peanutbother@proton.me";
    };

    sops = {
      age.keyFile = "/Volumes/Share/.nix/secrets/keys.txt";
      secrets = {
        "ssh-keys/git/peanutbother" = {
          path = "${home}/.ssh/github_peanutbother";
        };
        "ssh-keys/devs/bricksoft" = {
          path = "${home}/.ssh/dev_bricksoft";
        };
        "ssh-keys/devs/ravpower" = {
          path = "${home}/.ssh/dev_ravpower";
        };
        # "ssh-keys/devs/yubook" = {
        #   path = "${home}/.ssh/dev_yubook";
        #   sopsFile = ../../secrets/yubook.yaml;
        # };
      };
    };
  };
}
