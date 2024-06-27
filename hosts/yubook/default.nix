{
  system = "x86_64-darwin";
  user = "yuna";
  repo = "/Volumes/Share/.nix";

  # optionally override config
  # config = {
  #   inputs,
  #   mkHome,
  #   homebrew,
  #   ...
  # }: [
  #   # homebrew
  #   (homebrew {inherit user;})
  #   # home
  #   (mkHome {inherit user repo;})
  # ];

  # or just append modules
  # modules = inputs: [
  #   inputs.myModule
  # ];
}
