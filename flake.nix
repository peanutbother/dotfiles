{
  description = "yubook-conf";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-23.05-darwin";

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mkAlias = {
      url = "github:reckenrode/mkAlias";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix/85a0f2fe60a905a2726b10fd8dbccff0458900d4"; # TODO replace with main once fixed
      inputs.nixpkgs.follows = "nixpkgs";
    };

    embedded_shell = {
      url = "path:./shells/embedded";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix_shell = {
      url = "path:./shells/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust_shell = {
      url = "path:./shells/rust";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    web_shell = {
      url = "path:./shells/web";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { darwin, home-manager, sops-nix, ... } @ inputs:
    let
      system = "x86_64-darwin";
      stateVersion = "23.05";
      pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = import ./overlays;
      };
    in

    # system configs
    {
      darwinConfigurations.yubook = darwin.lib.darwinSystem {
        inherit system;

        specialArgs = {
          inherit inputs system stateVersion sops-nix;
        };

        modules = import ./modules { inherit home-manager; };
      };
    }

    // # shells
    {
      devShells.${system} = {
        embedded = inputs.embedded_shell.devShells.${system}.default;
        nix = inputs.nix_shell.devShells.${system}.default;
        rust = inputs.rust_shell.devShells.${system}.default;
        web = inputs.web_shell.devShells.${system}.default;
      };
    }

    // # templates
    {
      templates = {
        embedded = {
          description = "embedded development environment";
          path = ./templates/embedded;
        };
        nix = {
          description = "nix development environment";
          path = ./templates/nix;
        };
        rust = {
          description = "rust development environment";
          path = ./templates/rust;
        };
        rust-nix = {
          description = "rust development environment with nix flake";
          path = ./templates/rust-nix;
        };
        web = {
          description = "web development environment";
          path = ./templates/web;
        };
      };
    }
  ;
}
