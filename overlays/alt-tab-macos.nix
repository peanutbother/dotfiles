final: prev: {
  alt-tab-macos = prev.alt-tab-macos.overrideAttrs (_: prev: rec {
    version = "7.31.0";
    src = builtins.fetchurl {
      url = "https://github.com/lwouis/alt-tab-macos/releases/download/v${version}/AltTab-${version}.zip";
      sha256 = "sha256:4388994aa5a42adbd899142a823b210cb7ec9ec76adb87b6407d79d695ed1ff7";
    };
  });
}
