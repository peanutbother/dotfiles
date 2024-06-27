{
  fetchzip,
  lib,
  stdenv,
}:
stdenv.mkDerivation rec {
  pname = "sddm-${themeName}-theme";
  version = "0.0.1";
  themeName = "MacVentura";
  color = "Dark";

  dontBuild = true;
  installPhase = let
    themeDir = "$out/share/sddm/themes";
  in ''
    mkdir  -p ${themeDir}
    cp -r  "$src/sddm/${themeName}"                             "${themeDir}/${themeName}-${color}"
    chmod  +w                                                   "${themeDir}/${themeName}-${color}"
    cp     "$src/sddm/images/Background-${color}.jpg"           "${themeDir}/${themeName}-${color}/Background.jpg"
    cp     "$src/sddm/images/Preview-${color}.jpg"              "${themeDir}/${themeName}-${color}/Preview.jpg"
    sed -i "/\Name=/s/${themeName}/${themeName}-${color}/"      "${themeDir}/${themeName}-${color}/metadata.desktop"
    sed -i "/\Theme-Id=/s/${themeName}/${themeName}-${color}/"  "${themeDir}/${themeName}-${color}/metadata.desktop"
    sed -i "s/${themeName}/${themeName}-${color}/g"             "${themeDir}/${themeName}-${color}/Main.qml"
    sed -i "s#/usr/share/sddm/themes#${themeDir}#g"             "${themeDir}/${themeName}-${color}/Main.qml"
  '';

  meta = with lib; {
    description = "";
    homepage = "https://github.com/vinceliuice/MacVentura-kde";
    license = licenses.lgpl3;
    platforms = platforms.linux;
    maintainers = ["peanutbother"];
  };

  src = fetchzip {
    url = "https://github.com/vinceliuice/MacVentura-kde/archive/27432d8558d8995780a01f1d0babd29fe2da5e1e.zip";
    hash = "sha256-A6r6FKljvzVCAHJirRtyWKLNTVk/z9K0u+ndgeQwXlo";
  };
}
