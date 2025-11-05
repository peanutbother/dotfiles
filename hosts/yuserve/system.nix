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

  boot.loader = {
    systemd-boot.enable = false;
    grub.enable = true;
    grub.version = 2;
    grub.device = "/dev/xvda";
  };
}
