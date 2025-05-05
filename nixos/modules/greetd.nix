{ pkgs, ... }:

{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = ''
          ${pkgs.greetd.tuigreet}/bin/tuigreet \
            --asterisks \
            --theme 'text=cyan;prompt=green;input=cyan' \
            --cmd niri-session
        '';
      };
    };
  };

  # environment.etc."greetd/environments".text = '' sway '';
}
