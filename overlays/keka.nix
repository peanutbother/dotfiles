final: prev: {
  keka = prev.keka.overrideAttrs (_: prev: rec {
    version = "1.4.7";
    src = builtins.fetchurl {
      url = "https://github.com/aonez/Keka/releases/download/v${version}/Keka-${version}.zip";
      sha256 = "sha256:150ql281npf898h66y7x398c1h9hf0xf461q8qmggmhb514jjak8";
    };
  });
}
