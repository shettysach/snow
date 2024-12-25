{ pkgs, ... }:

{
  services.greetd = {
    enable = true;
    settings = {
      default_session.command = ''
        ${pkgs.greetd.tuigreet}/bin/tuigreet \
          --time \
          --asterisks \
          --theme 'text=cyan;prompt=green;input=cyan' \
          --cmd sway
      '';
    };
  };

  environment.etc."greetd/environments".text = ''
    sway
  '';
}
