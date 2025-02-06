{ pkgs, ... }:

{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;

    extraPackages = with pkgs; [
      wl-clipboard
      clipse

      i3blocks
      rofi-wayland
      autotiling-rs

      dunst
      libnotify

      swayidle
      swaylock

      grim
      slurp
      grimblast

      xfce.thunar
      xfce.thunar-volman
      xfce.thunar-archive-plugin
      xfce.thunar-media-tags-plugin
    ];
  };

  security.pam.services.swaylock = { };

  services.gnome.gnome-keyring.enable = true;
  services.gvfs.enable = true;
  services.tumbler.enable = true;
}
