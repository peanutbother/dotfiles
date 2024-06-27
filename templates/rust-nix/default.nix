{pkgs}:
pkgs.rustPlatform.buildRustPackage {
  name = "nixie";
  src = ./.;
  cargoLock.lockFile = ./Cargo.lock;
}
