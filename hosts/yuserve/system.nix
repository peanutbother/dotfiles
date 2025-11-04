{
  # config,
  ...
}: {
  system.stateVersion = "23.05";

  services.xserver.enable = false;

  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
  };

  programs.ssh = {
    startAgent = true;
    enableAskPassword = true;
  };
}
