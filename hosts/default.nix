# system configs
# attrName is used as host name
# `system` denotes the arch
# `type` denotes which system type (either `nixos` or `darwin`)
{
  yunix = {
    system = "x86_64-linux";
    type = "nixos";
  };

  yubook = {
    system = "x86_64-darwin";
    type = "darwin";
  };

  YunAir = {
    system = "aarch64-darwin";
    type = "darwin";
  };
}
