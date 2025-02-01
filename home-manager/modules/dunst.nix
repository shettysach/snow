{
  pkgs,
  config,
  lib,
  ...
}:

let
  inherit (lib) mkForce;

  inherit (config.lib.stylix.colors.withHashtag)
    base0A
    base0D
    base08
    ;
in
{
  services.dunst = {
    enable = true;

    settings = {
      iconTheme = {
        package = pkgs.kdePackages.breeze-icons;
        name = "breeze-dark";
      };

      global = {
        separator_height = 1;
        frame_width = 1;
        gap_size = 3;
        offset = "6x6";
        separator_color = mkForce "frame";

        word_wrap = "yes";
        transparency = 10;
        markup = "full";
      };

      urgency_low.frame_color = mkForce base0A;
      urgency_normal.frame_color = mkForce base0D;
      urgency_critical.frame_color = mkForce base08;
    };
  };
}
