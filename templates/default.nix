{
  # templates
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
    typescript = {
      description = "typescript development environment";
      path = ./templates/typescript;
    };
  };
}
