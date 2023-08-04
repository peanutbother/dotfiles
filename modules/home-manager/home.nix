{ pkgs, ... }:
{
  home = {
    # Don't change this when you change package input. Leave it alone.
    stateVersion = "23.05";

    packages = with pkgs; [
      bclm
      curl
      less
      neofetch
      wget
    ];

    sessionVariables = {
      PAGER = "less";
      COLOR = 1;
      CLICOLOR = 1;
      EDITOR = "code";
    };

    sessionPath = [
      "$HOME/.spicetify"
    ];

    shellAliases = {
      nixswitch = "nix run nix-darwin -- switch --flake ~/.nix/.#";
      nixup = "pushd ~/.nix; nix flake update; nixswitch; popd";
      cls = "clear";
      code = "env VSCODE_CWD=\"$PWD\" open -n -b \"com.microsoft.VSCode\" --args $*";
      # get_idf = ". $HOME/esp/esp-idf/export.sh"
    };
  };

  imports = [
    ./dotfiles
    ./programs
  ];
}
