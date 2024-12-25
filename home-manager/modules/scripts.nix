{ config, ... }:

{
  home.file."${config.xdg.configHome}/scripts" = {
    source = ../dots/scripts;
    executable = true;
  };
}
