{lib, ...}: {
  programs.yt-dlp = {
    enable = lib.mkDefault true;
  };
}
