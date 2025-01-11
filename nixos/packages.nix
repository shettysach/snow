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

    git

    # -- TUI / CLI utils --

    fastfetch
    btop
    dua

    lsd
    eza

    zoxide
    ripgrep
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

    # -- Browser --

    brave
    librewolf-wayland

    libreoffice-qt6
    zathura

    # Misc

    inputs.cohle.packages."${pkgs.system}".default
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
