{
  config,
  lib,
  ...
}: {
  options = {
    sound.pipewire = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "enable or disable sound stack with pipewire";
    };
  };

  config = lib.mkIf config.sound.pipewire {
    # Enable sound with pipewire.
    security.rtkit.enable = lib.mkDefault true;
    services.pipewire = {
      enable = lib.mkDefault true;
      alsa.enable = lib.mkDefault true;
      alsa.support32Bit = lib.mkDefault true;
      pulse.enable = lib.mkDefault true;
      jack.enable = lib.mkDefault true;
    };
  };
}
