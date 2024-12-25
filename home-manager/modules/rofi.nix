{ config, ... }:

{
  programs.rofi = {
    enable = true;
  };

  home.file."${config.xdg.configHome}/rofi" = {
    source = ../dots/rofi;
  };
}
