```console
.
├── README.md
├── nixos
│   ├── packages.nix
│   ├── modules
│   │   ├── sway.nix
│   │   ├── stylix.nix
│   │   ├── network.nix
│   │   ├── mod.nix
│   │   ├── greetd.nix
│   │   └── bluetooth.nix
│   ├── hardware-configuration.nix
│   └── configuration.nix
├── home-manager
│   ├── wallpapers
│   │   ├── aurora_lake.jpg
│   │   └── aurora_ice.jpg
│   ├── themes
│   │   └── tokyo-night-custom.yaml
│   ├── modules
│   │   ├── zsh.nix
│   │   ├── sway.nix
│   │   ├── stylix.nix
│   │   ├── mod.nix
│   │   ├── fzf.nix
│   │   └── dots.nix
│   ├── home.nix
│   └── dots
│       ├── waybar
│       │   ├── style.css
│       │   └── config.jsonc
│       ├── starship
│       │   └── starship.toml
│       ├── scripts
│       │   ├── power_menu
│       │   ├── player.sh
│       │   ├── bluetooth_menu
│       │   └── battery.sh
│       ├── rofi
│       │   └── config.rasi
│       ├── helix
│       │   ├── languages.toml
│       │   └── config.toml
│       └── fastfetch
│           └── config.jsonc
├── flake.nix
├── flake.lock
└── devshells
    ├── rust
    │   ├── rust-toolchain.toml
    │   └── flake.nix
    └── python
        ├── pyproject.toml
        └── flake.nix
```
