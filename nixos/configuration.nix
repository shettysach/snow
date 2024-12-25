{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
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
  services.xserver.enable = true;
  # services.xserver.libinput.enable = true;

  # services.displayManager.sddm.enable = true;
  # services.displayManager.sddm.wayland.enable = true;
  # services.desktopManager.plasma6.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
    #media-session.enable = true;
  };

  users.users.sword = {
    isNormalUser = true;
    description = "Sword";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
    ];
    packages = with pkgs; [ kdePackages.kate ];
  };

  programs.light.enable = true;
  programs.zsh.enable = true;
  users.users.sword.shell = pkgs.zsh;

  environment.variables.EDITOR = "nvim";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "24.05";
}
