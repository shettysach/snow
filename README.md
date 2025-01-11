.
├── tokyonight.yaml
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
│       │   ├── bluetooth_menu
│       │   └── battery.sh
│       ├── rofi
│       │   └── config.rasi
│       ├── helix
│       │   ├── languages.toml
│       │   └── config.toml
│       ├── ghostty
│       │   └── config
│       └── fastfetch
│           └── config.jsonc
├── flake.nix
└── flake.lock
