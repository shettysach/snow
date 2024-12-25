{ config, ... }:

{
  programs.waybar = {
    enable = true;
  };

  home.file."${config.xdg.configHome}/waybar" = {
    source = ../dots/waybar;
  };
}
