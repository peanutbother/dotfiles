{
  # templates
  templates = {
    embedded = {
      description = "embedded development environment";
      path = ./embedded;
    };
    nix = {
      description = "nix development environment";
      path = ./nix;
    };
    rust = {
      description = "rust development environment";
      path = ./rust;
    };
    rust-nix = {
      description = "rust development environment with nix flake";
      path = ./rust-nix;
    };
    typescript = {
      description = "typescript development environment";
      path = ./typescript;
    };
  };
}
