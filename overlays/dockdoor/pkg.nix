{
  lib,
  stdenv,
  fetchurl,
  undmg,
  nix-update-script,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "dockdoor";
  version = "1.37";

  src = fetchurl {
    url = "https://github.com/ejbills/DockDoor/releases/download/${finalAttrs.version}/DockDoor.dmg";
    hash = "sha256-GiwOgkpt9LRKeN0TOUQIlT1LaBco4lj6U4OoH30ZC8E=";
  };

  dontBuild = true;
  dontFixup = true;

  nativeBuildInputs = [undmg];

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall

    mkdir -p $out/Applications
    cp -R DockDoor.app $out/Applications

    runHook postInstall
  '';

  passthru.updateScript = nix-update-script {};

  meta = {
    description = "macOS Dock window preview and switcher";
    homepage = "https://dockdoor.net";
    changelog = "https://github.com/ejbills/DockDoor/releases/tag/${finalAttrs.version}";
    license = lib.licenses.gpl3;
    sourceProvenance = with lib.sourceTypes; [binaryNativeCode];
    mainProgram = "DockDoor.app";
    maintainers = with lib.maintainers; [peanutbother];
    platforms = lib.platforms.darwin;
  };
})
