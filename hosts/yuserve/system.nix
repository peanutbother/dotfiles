{
  # config,
  ...
}: {
  system.stateVersion = "24.11";

  services.xserver.enable = false;
  sound.pipewire = false;

  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
  };

  programs.ssh = {
    startAgent = true;
    enableAskPassword = true;
  };

  nix.settings.sandbox = false;
}
