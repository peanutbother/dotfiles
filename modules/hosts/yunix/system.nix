{
  networking.hostName = "yunix";

  programs.ssh = {
    startAgent = true;
    enableAskPassword = true;
  };
}
