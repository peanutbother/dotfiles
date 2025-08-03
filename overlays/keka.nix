inputs: final: prev: let
  fetchzip = inputs.nixpkgs.legacyPackages.${final.system}.fetchzip;
in {
  keka = prev.keka.overrideAttrs (_: prev: rec {
    version = "1.5.2";
    src = fetchzip {
      url = "https://github.com/aonez/Keka/releases/download/v${version}/Keka-${version}.zip";
      hash = "sha256-NtmHdKu15EnAk7izZVEjpAZ6KgwfT7W2biwJT3jo9o0=";
    };
  });
}
