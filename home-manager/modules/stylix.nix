{ pkgs, ... }:

{
  stylix = {
    enable = true;
    autoEnable = true;

    image = ../wallpapers/aurora_ice.jpg;
    base16Scheme = ../../tokyonight.yaml;

    targets = {
      swaylock.useImage = false;
      fzf.enable = false;
      helix.enable = false;
    };

    fonts = {
      serif = {
        name = "Cantarell";
        package = pkgs.cantarell-fonts;
      };

      sansSerif = {
        name = "Cantarell";
        package = pkgs.cantarell-fonts;
      };

      monospace = {
        name = "JetBrainsMono Nerd Font";
        package = pkgs.nerd-fonts.jetbrains-mono;
      };

      sizes = {
        desktop = 12;
        applications = 12;
        terminal = 14;
      };
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Original-Classic";
      size = 22;
    };

    opacity = {
      terminal = 0.8;
    };

    iconTheme = {
      enable = true;
      package = pkgs.kdePackages.breeze-icons;
      dark = "breeze-dark";
      light = "breeze";
    };
  };
}
