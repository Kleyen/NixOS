# NixOS

Denver's personal NixOS configuration, managed as a single flake with declarative system and user environments.

![NixOS](https://img.shields.io/badge/NixOS-unstable-blue?logo=nixos) [![flake](https://img.shields.io/badge/flake-enabled-brightgreen)](flake.nix)

## Overview

- **Host:** `nixos` — `x86_64-linux`, AMD CPU, BTRFS root with `home`/`nix` subvolumes + EFI system partition
- **Channel:** `nixos-unstable` (state version `26.05`)
- **Compositor:** [Mango](https://github.com/mangowm/mango) (scrollable-tiling Wayland compositor) with [Noctalia](https://github.com/noctalia-dev/noctalia) shell, launched via SDDM with the [SilentSDDM](https://github.com/uiriansan/SilentSDDM) theme
- **User environment:** [Home Manager](https://github.com/nix-community/home-manager), fully integrated as a NixOS module (no standalone `home-manager` command needed)

## Highlights

- 🧩 Modular design — every concern lives in its own file under `modules/` and `home/`
- 🪟 Mango window manager configured through both NixOS and Home Manager modules (appearance, keybinds, window rules, input, autostart)
- 🎨 System-wide theming with Noctalia quick settings
- 🖥️ Terminals: Ghostty, foot, WezTerm · Shell: zsh
- 🌐 Browsers: Firefox, Brave, Zen, qutebrowser
- 🎮 Gaming & media: Steam, Jellyfin, Celluloid, VLC, Parabolic (yt-dlp frontend)
- 📱 Android tooling: Waydroid (with `waydroid_script` submodule for Google Apps), ADB, scrcpy
- 💻 Dev: Zed, VS Code (FHS), WebStorm, Node.js, Python 3
- 🔒 Bitwarden desktop, LocalSend, Obsidian, Telegram, Vesktop, LibreOffice / ONLYOFFICE

## Repository structure

```
.
├── flake.nix / flake.lock        # Flake inputs & host definition
├── configuration.nix             # System entry point
├── hardware-configuration.nix    # Machine-specific hardware (generated)
├── home.nix                      # Home Manager entry point
├── modules/                      # System-level NixOS modules
│   ├── boot.nix                  # Bootloader & kernel
│   ├── nix.nix / nix-ld.nix      # Nix settings, dynamic linking for prebuilt binaries
│   ├── audio.nix / network.nix / locale.nix / hardware.nix
│   ├── mango.nix / cosmic.nix    # Wayland compositors
│   ├── sddm-theme.nix            # SilentSDDM login theme
│   ├── fonts.nix / shell.nix / users.nix / services.nix
│   ├── steam.nix / jellyfin.nix / qemu.nix
│   ├── waydroid.nix / adb.nix    # Android
│   └── zen-browser.nix
├── home/                         # Home Manager modules (user: denver)
│   ├── mango/                    # WM config: appearance, binds, rules, input, autostart, Noctalia
│   ├── zsh.nix / git.nix / ssh.nix
│   ├── ghostty.nix / foot.nix / wezterm.nix(.lua)
│   ├── fastfetch.nix / qutebrowser.nix / zed.nix
│   ├── packages.nix / programs.nix / theming.nix
└── waydroid_script/              # Git submodule (GAPPS/installer scripts for Waydroid)
```

## Usage

Clone the repo (submodule included):

```bash
git clone --recurse-submodules https://github.com/Kleyen/NixOS.git
cd NixOS
```

Apply the configuration:

```bash
sudo nixos-rebuild switch --flake .#nixos
```

Home Manager runs through the NixOS module, so the same command updates both system and user environment. Existing dotfiles are backed up with a `.backup` extension automatically.

Update all flake inputs:

```bash
nix flake update
```

Check the configuration before switching:

```bash
nix flake check
```

## Notes

- `hardware-configuration.nix` is machine-generated — edit `configuration.nix` or the relevant `modules/` file instead.
- If `waydroid_script` is empty after cloning, run `git submodule update --init --recursive`.
- This is a personal config: hostnames, UUIDs, usernames (`denver`), and package choices are tailored to one machine. Feel free to borrow ideas, but don't expect it to build unmodified elsewhere.
