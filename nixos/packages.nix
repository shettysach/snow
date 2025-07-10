{
  lib,
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = lib.attrValues {
    inherit
      (pkgs)
      # -- Nix --
      home-manager
      alejandra
      nixd
      nil
      # -- Dev --
      git
      git-lfs
      difftastic
      neovim
      zed-editor-fhs
      gemini-cli
      nix-direnv
      direnv
      nushell
      obsidian
      texliveSmall
      # -- TUI / CLI utils --
      fastfetch
      file
      jq
      joshuto
      dua
      zoxide
      ripgrep
      lsd
      eza
      bat
      delta
      fzf
      fd
      killall
      btop
      mpv
      imv
      zip
      unzip
      spotify-player
      gammastep
      networkmanagerapplet
      playerctl
      pulseaudio
      pulseaudio-ctl
      pavucontrol
      # -- windowManager --
      wl-clipboard
      wlr-randr
      clipse
      rofi-wayland
      autotiling-rs
      waybar
      dunst
      libnotify
      swayidle
      swaylock
      # -- GUI apps --
      brave
      librewolf
      firefox
      newsflash
      zathura
      fractal
      ;

    inherit
      (pkgs.xfce)
      thunar
      thunar-volman
      thunar-archive-plugin
      thunar-media-tags-plugin
      tumbler
      ;

    inherit (pkgs.nvtopPackages) nvidia;

    # inherit (pkgs) ghostty;
    ghostty = inputs.ghostty.packages.${pkgs.system}.default;
    helix = inputs.helix.packages.${pkgs.system}.default;
    cohle = inputs.cohle.packages.${pkgs.system}.default;
  };

  fonts.packages = lib.attrValues {
    inherit (pkgs) lora;

    inherit (pkgs.nerd-fonts) jetbrains-mono;
  };
}
