{ config, pkgs, ... }:

let
  cfg = config.wayland.windowManager.sway.config;
  scripts = "${config.xdg.configHome}/scripts";
in

{
  wayland.windowManager.sway = {
    enable = true;

    config = {
      startup = [
        { command = "autotiling-rs"; }
        { command = "clipse -listen"; }
        { command = "${scripts}/battery.sh"; }
      ];

      modifier = "Mod1";
      terminal = "ghostty";
      menu = "rofi -show drun";

      gaps = {
        inner = 5;
        outer = 2;
      };

      bars = [
        {
          position = "top";
          command = "waybar";
        }
      ];

      defaultWorkspace = "workspace number 1";

      window = {
        border = 3;
        titlebar = false;
      };

      keybindings = {
        "${cfg.modifier}+Return" = "exec ${cfg.terminal}";
        "${cfg.modifier}+Backspace" = "kill";
        "${cfg.modifier}+d" = "exec ${cfg.menu}";

        "${cfg.modifier}+Shift+c" = "reload";
        "${cfg.modifier}+r" = "mode resize";

        "${cfg.modifier}+${cfg.left}" = "focus left";
        "${cfg.modifier}+${cfg.down}" = "focus down";
        "${cfg.modifier}+${cfg.up}" = "focus up";
        "${cfg.modifier}+${cfg.right}" = "focus right";

        "${cfg.modifier}+Left" = "focus left";
        "${cfg.modifier}+Down" = "focus down";
        "${cfg.modifier}+Up" = "focus up";
        "${cfg.modifier}+Right" = "focus right";

        "${cfg.modifier}+Shift+${cfg.left}" = "move left";
        "${cfg.modifier}+Shift+${cfg.down}" = "move down";
        "${cfg.modifier}+Shift+${cfg.up}" = "move up";
        "${cfg.modifier}+Shift+${cfg.right}" = "move right";

        "${cfg.modifier}+Shift+Left" = "move left";
        "${cfg.modifier}+Shift+Down" = "move down";
        "${cfg.modifier}+Shift+Up" = "move up";
        "${cfg.modifier}+Shift+Right" = "move right";

        "${cfg.modifier}+b" = "splith";
        "${cfg.modifier}+v" = "splitv";
        "${cfg.modifier}+f" = "fullscreen toggle";
        "${cfg.modifier}+a" = "focus parent";

        "${cfg.modifier}+s" = "layout stacking";
        "${cfg.modifier}+w" = "layout tabbed";
        "${cfg.modifier}+e" = "layout toggle split";

        "${cfg.modifier}+Shift+space" = "floating toggle";
        "${cfg.modifier}+space" = "focus mode_toggle";

        "${cfg.modifier}+1" = "workspace number 1";
        "${cfg.modifier}+2" = "workspace number 2";
        "${cfg.modifier}+3" = "workspace number 3";
        "${cfg.modifier}+4" = "workspace number 4";
        "${cfg.modifier}+5" = "workspace number 5";
        "${cfg.modifier}+6" = "workspace number 6";
        "${cfg.modifier}+7" = "workspace number 7";
        "${cfg.modifier}+8" = "workspace number 8";
        "${cfg.modifier}+9" = "workspace number 9";
        "${cfg.modifier}+0" = "workspace number 10";

        "${cfg.modifier}+Shift+1" = "move container to workspace number 1";
        "${cfg.modifier}+Shift+2" = "move container to workspace number 2";
        "${cfg.modifier}+Shift+3" = "move container to workspace number 3";
        "${cfg.modifier}+Shift+4" = "move container to workspace number 4";
        "${cfg.modifier}+Shift+5" = "move container to workspace number 5";
        "${cfg.modifier}+Shift+6" = "move container to workspace number 6";
        "${cfg.modifier}+Shift+7" = "move container to workspace number 7";
        "${cfg.modifier}+Shift+8" = "move container to workspace number 8";
        "${cfg.modifier}+Shift+9" = "move container to workspace number 9";
        "${cfg.modifier}+Shift+0" = "move container to workspace number 10";

        "${cfg.modifier}+Shift+minus" = "move scratchpad";
        "${cfg.modifier}+minus" = "scratchpad show";

        "${cfg.modifier}+m" = "exec rofi -show power-menu -modi power-menu:${scripts}/power_menu";
        "${cfg.modifier}+Shift+b" = "exec bash ${scripts}/bluetooth_menu";

        "XF86MonBrightnessDown" = "exec light -U 5";
        "XF86MonBrightnessUp" = "exec light -A 5";

        "XF86AudioRaiseVolume" = "exec 'pactl set-sink-volume @DEFAULT_SINK@ +1%'";
        "XF86AudioLowerVolume" = "exec 'pactl set-sink-volume @DEFAULT_SINK@ -1%'";
        "XF86AudioMute" = "exec 'pactl set-sink-mute @DEFAULT_SINK@ toggle'";

        "XF86AudioPlay" = "exec 'playerctl play-pause'";
        "XF86AudioPause" = "exec 'playerctl play-pause'";
        "XF86AudioNext" = "exec 'playerctl next'";
        "XF86AudioPrev" = "exec 'playerctl prev'";
      };
    };

    extraConfig = ''
      bindgesture swipe:right workspace prev
      bindgesture swipe:left workspace next
    '';

    systemd = {
      enable = true;
      extraCommands = [
        "systemctl --user start sway-session.target"
      ];
      variables = [
        "DISPLAY"
        "WAYLAND_DISPLAY"
        "SWAYSOCK"
        "XDG_CURRENT_DESKTOP"
        "XDG_SESSION_TYPE"
        "NIXOS_OZONE_WL"
        "XCURSOR_THEME"
        "XCURSOR_SIZE"
        #"-all"
      ];
      xdgAutostart = false;
    };
  };

  programs.swaylock = {
    enable = true;
    settings = {
      daemonize = true;
      indicator-radius = 125;
      indicator-thickness = 5;
      font-size = 45;
    };
  };

  services.mako = {
    enable = true;
    icons = true;
    actions = true;
    layer = "overlay";

    defaultTimeout = 6000;
  };

  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock}/bin/swaylock";
      }

      {
        event = "lock";
        command = "${pkgs.swaylock}/bin/swaylock";
      }
    ];
    timeouts = [
      {
        timeout = 5 * 60;
        command = "${pkgs.swaylock}/bin/swaylock";
      }

      {
        timeout = 10 * 60;
        command = "${pkgs.sway}/bin/swaymsg 'output * dpms off'";
        resumeCommand = "${pkgs.sway}/bin/swaymsg 'output * dpms on'";
      }

      {
        timeout = 15 * 60;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
  };
}
