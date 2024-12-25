{ lib, ... }:

{
  programs.helix = {
    enable = true;
    settings = lib.importTOML ../dots/helix/config.toml;
    languages = lib.importTOML ../dots/helix/languages.toml;
  };
}
