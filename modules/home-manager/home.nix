{ pkgs, stateVersion, ... }:
{
  home = {
    inherit stateVersion;

    packages = with pkgs; [
      bclm
      curl
      less
      neofetch
      wget
    ];

    sessionVariables = {
      PAGER = "less"; # use less instead of more
      COLOR = 1; # force cli color
      CLICOLOR = 1; # force cli color
      EDITOR = "code"; # requires alias `code` from below
    };

    sessionPath = [
      "$HOME/.spicetify" # needs to be manually installed as of now (incompatible with macos)
    ];

    shellAliases = {
      sudo = "sudo "; # allow aliases to be run with sudo
      nixswitch = "nix run nix-darwin -- switch --flake ~/.nix/.#"; # refresh nix env after config changes
      nixup = "pushd ~/.nix; nix flake update; nixswitch; popd"; # update nix env and refresh
      cls = "clear"; # shorthand and alias to win's cls
      code = "env VSCODE_CWD=\"$PWD\" open -n -b \"com.microsoft.VSCode\" --args $*"; # create a shell alias for vs code
      # get_idf = ". $HOME/esp/esp-idf/export.sh"                                     # TODO install esp-idf somehow
    };
  };

  imports = [
    ./dotfiles # copy dotfiles into home
    ./programs # install and configure applications using home-manager
  ];
}
