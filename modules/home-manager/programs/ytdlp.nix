{
  lib,
  config,
  ...
}: {
  programs.yt-dlp = {
    enable = lib.mkDefault true;
  };

  programs.zsh = {
    envExtra = lib.mkIf config.programs.yt-dlp.enable ''
      # Download given URL as mp3 via youtube-dl into ~/Downloads
      yta(){
        yt-dlp -i -c -o "~/Downloads/%(title)s-%(id)s.%(ext)s" --extract-audio --audio-format mp3 --audio-quality 0 "$1"
      }
      # Download given URL as best single file video quality resolution via youtube-dl into ~/Downloads
      ytv(){
        yt-dlp "$1" -o "~/Downloads/%(title)s-%(id)s.%(ext)s"
      }
    '';
  };
}
