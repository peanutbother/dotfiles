{ fetchzip, lib, stdenv }: stdenv.mkDerivation rec {
  pname = "plymouth-mac-theme";
  version = "0.0.1";
  dontUnpack = true;
  dontBuild = true;

  src = builtins.path { path = ./mac; };

  installPhase = ''
  
    mkdir -p $out/share/plymouth/themes
    cp -r $src $out/share/plymouth/themes/mac
    chmod -R +w $out/share/plymouth/themes/mac
    chmod +x $out/share/plymouth/themes/mac/mac.plymouth $out/share/plymouth/themes/mac/mac.script
    sed -i "s@\/usr\/@$out\/@" $out/share/plymouth/themes/mac/mac.plymouth
  '';

  meta = with lib; {
    description = "A MacOS inspired boot theme for plymouth";
    homepage = "https://github.com/peanutbother/plymouth-mac-theme";
    # license = licenses.lgpl3;
    platforms = platforms.linux;
    maintainers = [ "peanutbother" ];
  };
}
