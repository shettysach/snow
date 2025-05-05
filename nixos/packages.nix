{
  inputs,
  pkgs,
  pkgs-stable,
  ...
}:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [

    # -- Nix --

    home-manager
    nixfmt-rfc-style
    nixd
    nil

    # -- Dev --

    alacritty
    ghostty

    git
    git-lfs
    difftastic

    neovim
    helix

    nix-direnv
    direnv

    nushell

    obsidian
    texliveSmall

    # TUI / CLI utils

    fastfetch

    btop
    nvtopPackages.nvidia

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

    mpv
    imv

    zip
    unzip

    gammastep

    networkmanagerapplet

    playerctl
    pulseaudio
    pulseaudio-ctl
    pavucontrol

    # windowManager

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

    # GUI

    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin

    brave
    pkgs-stable.librewolf

    newsflash
    zathura
    fractal

    kdePackages.kdeconnect-kde

    # Misc

    inputs.cohle.packages."${pkgs.system}".default
    inputs.glimpse.packages."${pkgs.system}".default
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    lora
  ];
}
