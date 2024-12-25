{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;

    firewall = {
      enable = true;
      # allowedTCPPorts = [ 80 ];
    };
  };

  programs.nm-applet.enable = true;
}
