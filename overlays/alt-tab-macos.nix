final: prev: {
  alt-tab-macos = prev.alt-tab-macos.overrideAttrs (_: prev: rec {
    version = "7.25.0";
    src = builtins.fetchurl {
      url = "https://github.com/lwouis/alt-tab-macos/releases/download/v${version}/AltTab-${version}.zip";
      sha256 = "sha256:0ji1vpq8n4xvp6n5m8rhq0657kws78sxf3yqwcifs76h8ygxwpbv";
    };
  });
}
