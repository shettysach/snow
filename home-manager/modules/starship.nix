{ lib, ... }:

{
  programs.starship = {
    enable = true;
    settings = lib.importTOML ../dots/starship/starship.toml;
  };
}
