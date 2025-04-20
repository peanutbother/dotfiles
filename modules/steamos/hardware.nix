{lib, ...}: {
  jovian.hardware = {
    has.amd.gpu = lib.mkDefault true;
  };
}
