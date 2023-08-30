{ pkgs, ... }:
let
  user = "yuna";
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
        spotify
        telegram-desktop
        vivaldi
      ];
    };

    programs = {
      alacritty = {
        settings.font.size = 8;
      };
      git = {
        userName = "peanutbother";
        userEmail = "peanutbother@proton.me";
      };
    };
  };
}
