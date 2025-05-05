{ pkgs, ... }:

{
  imports = [
    ./modules/mod.nix
  ];

  home = {
    username = "sword";
    homeDirectory = "/home/sword";
    stateVersion = "24.05";

    packages = with pkgs; [ starship ];
  };

  services.blueman-applet.enable = true;

  # services.kdeconnect.enable = true;
  # services.kdeconnect.indicator = true;
}
