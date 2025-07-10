{pkgs, ...}: {
  stylix = {
    enable = true;
    autoEnable = true;

    image = ../wallpapers/aurora_ice.jpg;
    base16Scheme = ../../tokyonight.yaml;

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

        # name = "Terminess Nerd Font";
        # package = pkgs.nerd-fonts.terminess-ttf;
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
      terminal = 0.85;
    };

    iconTheme = {
      enable = true;
      package = pkgs.kdePackages.breeze-icons;
      dark = "breeze-dark";
      light = "breeze";
    };
  };
}
