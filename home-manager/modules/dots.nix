{
  lib,
  config,
  pkgs,
  ...
}:

{
  programs = {
    bat.enable = true;
    waybar.enable = true;

    rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
    };
  };

  programs.alacritty = {
    enable = true;
    settings.window.dynamic_padding = true;
    # settings = lib.importTOML ../dots/alacritty/alacritty.toml;
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

  programs.fastfetch = {
    enable = true;
    settings = lib.importJSON ../dots/fastfetch/config.jsonc;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zathura = {
    enable = true;
    options = {
      first-page-column = "1:1";
      statusbar-home-tilde = true;
      window-title-home-tilde = true;
      statusbar-basename = true;
      window-title-basename = true;
      selection-clipboard = "clipboard";
    };
  };

  home.file = {
    # "${config.xdg.configHome}/ghostty".source = ../dots/ghostty;
    "${config.xdg.configHome}/waybar".source = ../dots/waybar;
    "${config.xdg.configHome}/rofi".source = ../dots/rofi;
    "${config.xdg.configHome}/scripts" = {
      source = ../dots/scripts;
      executable = true;
    };
  };
}
