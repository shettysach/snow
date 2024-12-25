{ lib, config, ... }:

{
  programs = {
    bat.enable = true;
    waybar.enable = true;
    rofi.enable = true;
    fastfetch.enable = true;
  };

  programs.helix = {
    enable = true;
    settings = lib.importTOML ../dots/helix/config.toml;
    languages = lib.importTOML ../dots/helix/languages.toml;
  };

  programs.starship = {
    enable = true;
    settings = lib.importTOML ../dots/starship/starship.toml;
  };

  home.file = {
    "${config.xdg.configHome}/waybar".source = ../dots/waybar;
    "${config.xdg.configHome}/rofi".source = ../dots/rofi;
    "${config.xdg.configHome}/fastfetch".source = ../dots/fastfetch;
    "${config.xdg.configHome}/scripts" = {
      source = ../dots/scripts;
      executable = true;
    };
  };
}
