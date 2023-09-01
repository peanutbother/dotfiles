{ inputs, pkgs, ... }:
let
  user = "yuna";
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in
{
  users.users.${user} = {
    isNormalUser = true;
    group = "users";
    # extraGroups = [ "audio" "networkmanager" "systemd-journal" "video" "wheel" ];
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
  home-manager.users.${user} = {
    imports = [ inputs.spicetify-nix.homeManagerModule ];
    home = {
      file = {
        ".config/latte" = {
          source = ../../modules/home-manager/dotfiles/latte-dock;
          recursive = true;
        };
        ".ssh" = {
          source = ../../modules/home-manager/dotfiles/ssh;
          recursive = true;
        };
      };

      shellAliases = {
        nixswitch = "sudo nixos-rebuild switch --flake ~/.nix/.#"; # refresh nix env after config changes
      };

      packages = with pkgs; [
        # *nix packages
        discord
        latte-dock
        networkmanager
        putty
        signal-desktop-beta
        spectacle
        telegram-desktop
        vivaldi
      ];
    };

    programs = {
      alacritty = {
        settings.font.size = 10;
      };
      git = {
        userName = "peanutbother";
        userEmail = "peanutbother@proton.me";
      };
      spicetify = {
        enable = true;
        theme = spicePkgs.themes.Bloom;
        enabledExtensions = with spicePkgs.extensions; [
          adblock
        ];
        enabledCustomApps = with spicePkgs.apps; [
          marketplace
          lyrics-plus
          {
            name = "combined-playlists";
            src = builtins.fetchGit {
              url = "https://github.com/jeroentvb/spicetify-combined-playlists";
              rev = "fc2589ad83ea069035af0b0e1544a9688b871566";
              ref = "dist";
            };
            appendName = true;
          }
        ];
      };
    };
  };
}
