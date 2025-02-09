{
  pkgs,
  lib,
  ...
}:

{
  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw
  services.dbus.packages = with pkgs; [ dconf ];

  services.xserver = {
    enable = true;

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        xclip
        autotiling
        feh
        picom-next
      ];

      extraSessionCommands = ''
        ${pkgs.xorg.xrandr}/bin/xrandr --setprovideroutputsource modesetting NVIDIA-0
        ${pkgs.xorg.xrandr}/bin/xrandr --auto

        export WINIT_X11_SCALE_FACTOR=2
        export GDK_SCALE=2
        export GDK_DPI_SCALE=0.5
        export _JAVA_OPTIONS="-Dsun.java2d.uiScale=2"

        alias brave="brave --force-device-scale-factor=2" // TODO: better fix
      '';
    };

    desktopManager.xterm.enable = false;
    excludePackages = [ pkgs.xterm ];

    dpi = 192;
    upscaleDefaultCursor = true;

    autorun = false;
    displayManager.startx.enable = true;
    displayManager.lightdm.enable = false;
  };

  environment.sessionVariables = lib.mkIf (builtins.getEnv "XDG_SESSION_DESKTOP" == "none+i3") {
    WINIT_X11_SCALE_FACTOR = "2";
    GDK_SCALE = "2";
    GDK_DPI_SCALE = "0.5";
    _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
  };

  services.displayManager.defaultSession = "none+i3";
}
