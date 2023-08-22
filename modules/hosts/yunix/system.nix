{
  system.stateVersion = "23.05";
  networking.hostName = "yunix";

  programs.ssh = {
    startAgent = true;
    enableAskPassword = true;
  };
}
