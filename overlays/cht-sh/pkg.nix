{
  lib,
  stdenv,
  pkgs,
}:
stdenv.mkDerivation {
  pname = "cht-sh";
  version = "0.0.4";

  meta = with lib; {
    description = "Access cheatsheets easily in a popup in tmux!";
    homepage = "https://github.com/kenos1/tmux-cht-sh";
    license = licenses.mit;
    platforms = platforms.linux ++ platforms.darwin;
    maintainers = ["peanutbother"];
  };

  src = ./src;

  nativeBuildInputs = [pkgs.makeWrapper];
  installPhase = ''
    mkdir --parents "$out"
    cp * $out
    chmod +x $out/*.sh
    wrapProgram $out/tmux.sh --prefix PATH : ${lib.makeBinPath [pkgs.fzf]}
  '';
}
