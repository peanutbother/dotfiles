{
  system.defaults.alf.globalstate = 1; # enable firewall

  networking = {
    # AdGuard DNS
    dns = [
      "94.140.14.14"
      "94.140.15.15"
    ];

    knownNetworkServices = [ "Wi-Fi" ];
  };
}
