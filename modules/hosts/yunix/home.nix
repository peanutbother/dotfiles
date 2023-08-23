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
          source = ../../home-manager/dotfiles/latte-dock;
          recursive = true;
        };
      };
      shellAliases = {
        nixswitch = "sudo nixos-rebuild switch --flake ~/.nix/.#"; # refresh nix env after config changes
      };
    };

    programs.alacritty = {
      settings.font.size = 8;
    };
  };

  packages = with pkgs; [
    # *nix packages
    discord
    latte-dock
    putty
    signal-desktop-beta
    spotify
    telegram-desktop
    vivaldi
  ];
}
