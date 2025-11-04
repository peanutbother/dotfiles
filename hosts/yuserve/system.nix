{
  # config,
  ...
}: {
  system.stateVersion = "24.11";

  services.xserver.enable = false;
  sound.enable = false;

  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
  };

  programs.ssh = {
    startAgent = true;
    enableAskPassword = true;
  };
}
