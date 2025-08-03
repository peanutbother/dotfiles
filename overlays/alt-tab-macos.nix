final: prev: {
  alt-tab-macos = prev.alt-tab-macos.overrideAttrs (_: prev: rec {
    version = "7.26.0";
    src = builtins.fetchurl {
      url = "https://github.com/lwouis/alt-tab-macos/releases/download/v${version}/AltTab-${version}.zip";
      sha256 = "sha256:16xhlvk11h8h46z0nvbxyrn2dxs6m2c3hkz9j7v11xkhaqcbwg5l";
    };
  });
}
