{ pkgs, ... }:

{
  stylix = {
    enable = true;
    autoEnable = true;

    base16Scheme = ../themes/tokyo-night-custom.yaml;
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

      # monospace = {
      #   name = "JetBrainsMono Nerd Font";
      #   package = pkgs.nerd-fonts.jetbrains-mono;
      # };

      sizes = {
        desktop = 12;
        applications = 12;
      };
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Original-Classic";
      size = 20;
    };
  };
}
