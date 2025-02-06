{
  pkgs,
  ...
}:

{
  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw

  services.dbus.packages = with pkgs; [ dconf ];
  services.xserver = {
    enable = true;
    desktopManager.xterm.enable = false;
    dpi = 192;
    upscaleDefaultCursor = true;

    autorun = false;
    displayManager.startx.enable = true;
    displayManager.lightdm.enable = false;

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        autotiling
        rofi
        polybar
        feh
        picom-next
        xclip
      ];
    };
  };

  services.displayManager.defaultSession = "none+i3";
}
