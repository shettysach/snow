{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;

    firewall = {
      enable = true;
    };
  };

  programs.kdeconnect.enable = true;
  programs.nm-applet.enable = true;
}
