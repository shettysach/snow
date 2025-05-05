{
  pkgs,
  config,
  ...
}:

let
  scripts = "${config.xdg.configHome}/scripts";
in
{
  programs.niri.enable = true;
  services.wpaperd.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];

    config.common.default = "*";
  };

  programs.niri.settings = {
    environment = {
      CLUTTER_BACKEND = "wayland";
      DISPLAY = null;
      GDK_BACKEND = "wayland,x11";
      MOZ_ENABLE_WAYLAND = "1";
      NIXOS_OZONE_WL = "1";
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_QPA_PLATFORMTHEME = "gtk3";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      SDL_VIDEODRIVER = "wayland";

      XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "niri";
    };

    spawn-at-startup = [
      { command = [ "${pkgs.waybar}/bin/waybar" ]; }
      { command = [ "${scripts}/battery.sh" ]; }
      {
        command = [
          "${pkgs.clipse}/bin/clipse"
          "-listen"
        ];
      }
    ];

    hotkey-overlay.skip-at-startup = true;
    input.focus-follows-mouse.enable = true;
    layout.gaps = 6;

    animations.enable = true;
    animations.slowdown = 0.5;

    binds = {
      "XF86AudioRaiseVolume" = {
        allow-when-locked = true;
        action.spawn = [
          "wpctl"
          "set-volume"
          "@DEFAULT_AUDIO_SINK@"
          "0.1+"
        ];
      };
      "XF86AudioLowerVolume" = {
        allow-when-locked = true;
        action.spawn = [
          "wpctl"
          "set-volume"
          "@DEFAULT_AUDIO_SINK@"
          "0.1-"
        ];
      };
      "XF86AudioMute" = {
        allow-when-locked = true;
        action.spawn = [
          "wpctl"
          "set-mute"
          "@DEFAULT_AUDIO_SINK@"
          "toggle"
        ];
      };
      "XF86AudioMicMute" = {
        allow-when-locked = true;
        action.spawn = [
          "wpctl"
          "set-mute"
          "@DEFAULT_AUDIO_SOURCE@"
          "toggle"
        ];
      };

      "XF86MonBrightnessDown" = {
        allow-when-locked = true;
        action.spawn = [
          "light"
          "-U"
          "5"
        ];
      };
      "XF86MonBrightnessUp" = {
        allow-when-locked = true;
        action.spawn = [
          "light"
          "-A"
          "5"
        ];
      };

      "Alt+Return".action.spawn = "alacritty";
      "Alt+Shift+Return".action.spawn = "ghostty";
      "Alt+Backspace".action.close-window = { };
      "Alt+D".action.spawn = [
        "${pkgs.rofi-wayland}/bin/rofi"
        "-show"
        "drun"
      ];

      "Alt+K".action.focus-window-or-workspace-up = { };
      "Alt+J".action.focus-window-or-workspace-down = { };
      "Alt+H".action.focus-column-left = { };
      "Alt+L".action.focus-column-right = { };
      "Alt+F".action.fullscreen-window = { };
      "Alt+Backslash".action.maximize-column = { };

      "Alt+Shift+H".action.move-column-left = { };
      "Alt+Shift+J".action.move-window-down-or-to-workspace-down = { };
      "Alt+Shift+K".action.move-window-up-or-to-workspace-up = { };
      "Alt+Shift+L".action.move-column-right = { };

      "Alt+BracketLeft".action.consume-or-expel-window-left = { };
      "Alt+BracketRight".action.consume-or-expel-window-right = { };

      "Alt+Equal".action.set-column-width = "+10%";
      "Alt+Minus".action.set-column-width = "-10%";

      "Alt+M".action.spawn = [
        "${pkgs.rofi-wayland}/bin/rofi"
        "-show"
        "power-menu"
        "-modi"
        "power-menu:${scripts}/power_menu"
      ];
      "Alt+Shift+B".action.spawn = [
        "bash"
        "${scripts}/bluetooth_menu"
      ];

      "Alt+S".action.screenshot = { };

      "Alt+0".action.focus-workspace = 10;
      "Alt+2".action.focus-workspace = 2;
      "Alt+3".action.focus-workspace = 3;
      "Alt+4".action.focus-workspace = 4;
      "Alt+5".action.focus-workspace = 5;
      "Alt+6".action.focus-workspace = 6;
      "Alt+7".action.focus-workspace = 7;
      "Alt+8".action.focus-workspace = 8;
      "Alt+9".action.focus-workspace = 9;

      "Alt+Shift+0".action.move-window-to-workspace = 10;
      "Alt+Shift+1".action.move-window-to-workspace = 1;
      "Alt+Shift+2".action.move-window-to-workspace = 2;
      "Alt+Shift+3".action.move-window-to-workspace = 3;
      "Alt+Shift+4".action.move-window-to-workspace = 4;
      "Alt+Shift+5".action.move-window-to-workspace = 5;
      "Alt+Shift+6".action.move-window-to-workspace = 6;
      "Alt+Shift+7".action.move-window-to-workspace = 7;
      "Alt+Shift+8".action.move-window-to-workspace = 8;
      "Alt+Shift+9".action.move-window-to-workspace = 9;

      "Alt+Space".action.switch-focus-between-floating-and-tiling = { };
      "Alt+Shift+Space".action.toggle-window-floating = { };
    };

    window-rules = [
      {
        draw-border-with-background = false;
        default-column-width.proportion = 0.5;
      }
    ];
  };
}
