{ inputs, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [

    # -- Nix --

    home-manager
    nixfmt-rfc-style
    nixd
    nil

    # -- Dev --

    ghostty

    neovim
    helix

    obsidian
    texliveSmall

    git

    # -- TUI / CLI utils --

    fastfetch
    btop
    dua

    zoxide
    ripgrep
    lsd
    eza
    bat
    fzf
    fd

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

    brave
    librewolf-wayland

    zathura

    fractal
    discord

    # Misc

    inputs.cohle.packages."${pkgs.system}".default
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    lora
  ];
}
