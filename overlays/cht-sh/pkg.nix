{ lib, fetchzip, stdenv, pkgs }: stdenv.mkDerivation rec {
  pname = "cht-sh";
  version = "0.0.3";

  meta = with lib; {
    description = "Access cheatsheets easily in a popup in tmux!";
    homepage = "https://github.com/kenos1/tmux-cht-sh";
    license = licenses.mit;
    platforms = platforms.linux ++ platforms.darwin;
    maintainers = [ "kenos1" ];
  };

  src = ./src;

  installPhase = ''
    mkdir --parents "$out"
    cp * $out
    cp ${pkgs.fzf}/bin/fzf $out
    chmod +x $out/*.sh
  '';
}
