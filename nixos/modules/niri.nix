{ pkgs, ... }:
{
  programs.niri = {
    enable = true;
    package = pkgs.niri-stable;
  };

  niri-flake.cache.enable = true;
}
