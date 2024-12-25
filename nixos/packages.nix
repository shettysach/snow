{ inputs, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [

    # Nix

    home-manager
    nixfmt-rfc-style
    nixd
    nil

    # Dev

    neovim
    helix
    alacritty
    git

    # TUI / CLI utils

    fastfetch
    ripgrep
    btop
    fzf
    dua
    lsd
    eza
    bat
    fd
    mpv

    networkmanagerapplet
    playerctl

    # Browser

    brave
    librewolf-wayland

    libreoffice-qt6

    # Misc

    inputs.cohle.packages."${pkgs.system}".default
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
