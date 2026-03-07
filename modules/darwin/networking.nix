{
  host,
  lib,
  ...
}: {
  networking = {
    # enable firewall
    applicationFirewall.enable = true;

    knownNetworkServices = ["Wi-Fi"];

    computerName = lib.mkDefault host;
    hostName = lib.mkDefault host;
    localHostName = lib.mkDefault host;
  };
}
