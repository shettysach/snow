{ pkgs, ... }:

{
  stylix = {
    enable = true;
    autoEnable = true;

    base16Scheme = ../../tokyonight.yaml;
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-terminal-dark.yaml";
    # override.base05 = "#A9B1D6";
    image = ../wallpapers/aurora_lake.jpg;

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

    opacity.terminal = 0.85;

    iconTheme = {
      enable = true;
      package = pkgs.kdePackages.breeze-icons;
      dark = "breeze-dark";
      light = "breeze";
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Original-Classic";
      size = 22;
    };
  };
}
