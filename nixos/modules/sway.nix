{ pkgs, ... }:

{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;

    extraPackages = with pkgs; [
      wl-clipboard
      wlr-randr
      clipse

      rofi-wayland
      autotiling-rs

      dunst
      libnotify

      swayidle
      swaylock

      grim
      slurp
      grimblast
    ];
  };

  security.pam.services.swaylock = { };

  services.gnome.gnome-keyring.enable = true;
  services.gvfs.enable = true;
  services.tumbler.enable = true;
}
