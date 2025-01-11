# { pkgs, ... }:

{
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = ../../tokyonight.yaml;
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-terminal-dark.yaml";
    # override.base05 = "#A9B1D6";

    targets = {
      gtk.enable = true;
      chromium.enable = true;
    };
  };
}
