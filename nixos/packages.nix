{
  inputs,
  pkgs,
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

    neovim
    helix

    obsidian
    texliveSmall

    git

    # -- TUI / CLI utils --

    fastfetch

    btop
    nvtopPackages.nvidia

    dua

    zoxide
    ripgrep
    lsd
    eza
    bat
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

    # -- GUI --

    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin

    brave
    librewolf-wayland

    zathura

    fractal

    # Misc

    inputs.cohle.packages."${pkgs.system}".default

  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    lora
  ];
}
