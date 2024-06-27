{
  host,
  lib,
  ...
}: {
  system.defaults.alf.globalstate = lib.mkDefault 1; # enable firewall

  networking = {
    # AdGuard DNS
    dns = lib.mkDefault [
      "94.140.14.14"
      "94.140.15.15"
    ];

    knownNetworkServices = ["Wi-Fi"];

    computerName = lib.mkDefault host;
    hostName = lib.mkDefault host;
    localHostName = lib.mkDefault host;
  };
}
