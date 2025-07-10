{ pkgs, inputs, ... }:

{
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.settings = {
    substituters = [
      "https://nix-community.cachix.org"
      "https://niri.cachix.org"
      "https://helix.cachix.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
      "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
    ];
  };

  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./nvidia.nix
    ./modules/mod.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  security.polkit.enable = true;
  security.rtkit.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  system.nssDatabases.hosts = [
    "files mdns_minimal [NOTFOUND=return] dns mdns"
  ];

  # services.printing = {
  #   enable = true;
  #   drivers = with pkgs; [
  #     gutenprint
  #     epson-201401w
  #   ];
  #   browsing = true;
  #   defaultShared = true;
  #   openFirewall = true;
  #   browsedConf = ''
  #     BrowseDNSSDSubTypes _cups,_print
  #     BrowseLocalProtocols all
  #     BrowseRemoteProtocols all
  #     CreateIPPPrinterQueues All
  #     BrowseProtocols all
  #   '';
  # };
  #
  # services.avahi = {
  #   enable = true;
  #   nssmdns = true;
  #   openFirewall = true;
  #   publish = {
  #     enable = true;
  #     userServices = true;
  #   };
  # };

  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
    #media-session.enable = true;
  };

  services.gvfs.enable = true;
  services.udev.packages = [
    pkgs.android-udev-rules
    pkgs.libmtp.out
  ];

  programs = {
    light.enable = true;
    zsh.enable = true;
  };

  users.users.sword = {
    isNormalUser = true;
    description = "Sword";
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
    ];
  };

  environment.variables.EDITOR = "nvim";

  system.stateVersion = "24.05";
}
