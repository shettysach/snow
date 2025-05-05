{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.wayland.windowManager.sway.config;
  scripts = "${config.xdg.configHome}/scripts";
  alt_terminal = "${pkgs.ghostty}/bin/ghostty";

  # transparent = "#00000000";
  inherit (lib) mkForce;
  inherit (config.lib.stylix.colors.withHashtag)
    base03
    # base04
    # base05
    # base08
    # base0C
    ;

in
{
  wayland.windowManager.sway = {
    enable = true;

    config = {
      startup = [
        { command = "${pkgs.autotiling-rs}/bin/autotiling-rs"; }
        { command = "${pkgs.clipse}/bin/clipse -listen"; }
        { command = "${scripts}/battery.sh"; }
      ];

      modifier = "Mod1";
      terminal = "${pkgs.alacritty}/bin/alacritty";
      menu = "${pkgs.rofi-wayland}/bin/rofi -show drun";

      bars = [
        {
          position = "top";
          command = "waybar";
        }
      ];

      # bars = [
      #   {
      #     position = "top";
      #     statusCommand = ''
      #       ${pkgs.i3status-rust}/bin/i3status-rs \
      #       ${config.xdg.configHome}/i3status-rust/config.toml'';
      #     fonts = {
      #       names = [ "JetBrains Mono Nerd Font" ];
      #       size = 13.0;
      #     };
      #
      #     colors = {
      #       background = transparent;
      #       separator = transparent;
      #       statusline = base05;
      #
      #       focusedWorkspace = {
      #         background = transparent;
      #         border = transparent;
      #         text = base0C;
      #       };
      #
      #       activeWorkspace = {
      #         background = transparent;
      #         border = transparent;
      #         text = base05;
      #       };
      #
      #       urgentWorkspace = {
      #         background = "${base08}33";
      #         border = transparent;
      #         text = base08;
      #       };
      #
      #       inactiveWorkspace = {
      #         background = transparent;
      #         border = transparent;
      #         text = base04;
      #       };
      #     };
      #   }
      # ];

      defaultWorkspace = "workspace number 1";

      window = {
        border = 3;
        titlebar = false;
      };

      gaps = {
        inner = 4;
        outer = 1;
      };

      colors.unfocused.indicator = mkForce base03;
      colors.focusedInactive.indicator = mkForce base03;

      keybindings = {
        "${cfg.modifier}+Return" = "exec ${cfg.terminal}";
        "${cfg.modifier}+Shift+Return" = "exec ${alt_terminal}";
        "${cfg.modifier}+Backspace" = "kill";
        "${cfg.modifier}+d" = "exec ${cfg.menu}";

        "${cfg.modifier}+Shift+c" = "reload";
        "${cfg.modifier}+r" = "mode resize";
        "${cfg.modifier}+Shift+S" = ''exec grim -g "$(slurp -d)" - | wl-copy'';

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

        "${cfg.modifier}+m" =
          "exec ${pkgs.rofi-wayland}/bin/rofi -show power-menu -modi power-menu:${scripts}/power_menu";
        "${cfg.modifier}+Shift+b" = "exec bash ${scripts}/bluetooth_menu";

        "XF86MonBrightnessDown" = "exec light -U 5";
        "XF86MonBrightnessUp" = "exec light -A 5";

        "XF86AudioRaiseVolume" = "exec 'pactl set-sink-volume @DEFAULT_SINK@ +5%'";
        "XF86AudioLowerVolume" = "exec 'pactl set-sink-volume @DEFAULT_SINK@ -5%'";
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
        "NIXOS_OZONE_WL"
        "SWAYSOCK"
        "XDG_CURRENT_DESKTOP"
        "XDG_SESSION_TYPE"
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
  stylix.targets.swaylock.useImage = false;

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

      # {
      #   timeout = 15 * 60;
      #   command = "${pkgs.systemd}/bin/systemctl suspend";
      # }
    ];
  };
}
