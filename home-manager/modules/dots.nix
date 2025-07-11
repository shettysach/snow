{
  lib,
  config,
  pkgs,
  ghosttyMain,
  helixMain,
  ...
}: {
  programs.bat.enable = true;
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };

  stylix.targets.qt.enable = true;

  programs.btop = {
    enable = true;
    settings.vim_keys = true;
  };

  stylix.targets.swaylock.useImage = false;
  programs.swaylock = {
    enable = true;
    settings = {
      daemonize = true;
      indicator-radius = 125;
      indicator-thickness = 5;
      font-size = 45;
    };
  };

  programs.ghostty = {
    # package = ghosttyMain;
    enable = true;
    settings = {
      resize-overlay = "never";
      window-padding-x = 0;
      window-padding-y = 0;
      window-padding-balance = true;
      cursor-invert-fg-bg = true;
      window-decoration = false;
      confirm-close-surface = false;

      keybind = [
        "super+r=reload_config"
        "super+d=toggle_window_decorations"

        "super+enter=new_split:auto"
        "super+backspace=close_surface"

        "super+h=goto_split:left"
        "super+j=goto_split:bottom"
        "super+k=goto_split:top"
        "super+l=goto_split:right"

        "super+n=jump_to_prompt:1"
        "super+p=jump_to_prompt:-1 "
      ];
    };
  };

  # stylix.targets.nushell.enable = false;
  programs.nushell = {
    enable = true;
    configFile.source = ../dots/nu/config.nu;
  };

  stylix.targets.fzf.enable = false;
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultOptions = [
      "--color 16"
      "--layout reverse"
      "--preview-window right:50%:sharp"
      "--prompt '❯ '"
    ];

    fileWidgetCommand = "fd --type f";
    fileWidgetOptions = [
      "--preview 'bat --color always {}'"
    ];

    changeDirWidgetOptions = [
      "--preview 'eza -T -L 3 --git-ignore --icons always --color always {}'"
    ];
  };

  stylix.targets.helix.enable = false;
  programs.helix = {
    enable = true;
    package = helixMain;
    settings = lib.importTOML ../dots/helix/config.toml;
    languages = lib.importTOML ../dots/helix/languages.toml;
    themes.tokyonight_transparent = lib.importTOML ../dots/helix/tokyonight_transparent.toml;
  };

  programs.starship = {
    enable = true;
    settings = lib.importTOML ../dots/starship/nerd_font_symbols.toml;
  };

  programs.fastfetch = {
    enable = true;
    settings = lib.importJSON ../dots/fastfetch/config.jsonc;
  };

  programs.zoxide.enable = true;

  programs.zathura = {
    enable = true;
    options = {
      first-page-column = "1:1";
      statusbar-home-tilde = true;
      window-title-home-tilde = true;
      statusbar-basename = true;
      window-title-basename = true;
      recolor = true;
      recolor-keephue = true;
      selection-clipboard = "clipboard";
    };
  };

  home.file = {
    # "${config.xdg.configHome}/i3status-rust".source = ../dots/i3status-rust;
    "${config.xdg.configHome}/waybar".source = ../dots/waybar;
    "${config.xdg.configHome}/rofi".source = ../dots/rofi;
    "${config.xdg.configHome}/scripts" = {
      source = ../dots/scripts;
      executable = true;
    };
  };
}
