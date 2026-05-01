# Gruvforest: An environment of organic minimalism

> Press `Super + F1` to open the cheatsheet.

A modern, extensible **Wayland** configuration for Linux (NixOS) powered by the **Nix** package manager and the **Gruvbox** colorscheme. Fully declarative, reproducible, and easy to customize.

---

## Features

**Lightweight & Performant** — River is tuned for near-maximum efficiency, staying out of the way of demanding workloads.

**Near-Complete Daily Driver** — Everything you need for a functional desktop without the bloat: a minimal yet powerful Waybar panel, a fast app launcher (tofi), essential utilities, and sensible app defaults.

**Outstanding Developer Experience** — A fully configured dev environment via Home Manager, including Neovim with NvChad, a batteries-included Zsh setup, and the tmux terminal multiplexer.

**Coherent & Declarative** — Almost everything is managed in pure Nix via Home Manager. No scattered config files.

---

## Installation

> Requires NixOS with flakes enabled.

```bash
git clone https://github.com/joaquin-angeles/.files.git
cd .files
sudo nixos-rebuild switch --flake --impure ./nix#nixos-btw
```

---

## Customization

All configuration lives under three entrypoints:

| Path              | Purpose                                        |
| ----------------- | ---------------------------------------------- |
| `nixos/flake.nix` | Flake inputs, outputs, and top-level wiring    |
| `nixos/host/`     | System-level config (hardware, services, apps) |
| `nixos/home/`     | User environment via Home Manager              |

Extending or overriding modules is straightforward thanks to Nix's declarative nature.

---

## Preview

| Resource usage                                 | Tiled layout                                 |
| ---------------------------------------------- | -------------------------------------------- |
| ![Resource usage](./assets/previews/stats.png) | ![Tiled layout](./assets/previews/tiled.png) |

| Background Wallpaper                                | GUI Applications                  |
| --------------------------------------------------- | --------------------------------- |
| ![Background / Wallpaper](./assets/previews/bg.png) | ![GUI](./assets/previews/gui.png) |
