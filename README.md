[![build-arch](https://github.com/breningham/arch/actions/workflows/build-boxkit.yml/badge.svg?branch=main)](https://github.com/breningham/arch/actions/workflows/build-boxkit.yml)

# breningham/arch

A custom OCI Image based of of [ublue-os/arch-distrobox](https://github.com/ublue-os/arch-distrobox) using [boxkit](https://github.com/ublue-os/boxkit) for use in distrobox

# how to use

make sure distrobox is installed

## with KDE

- `distrobox create --image ghcr.io/breningham/arch-kde -n arch`
- `distrobox enter arch -- fish`

## with GNOME

- `distrobox create --image ghcr.io/breningham/arch-gnome -n arch`
- `distrobox enter arch -- fish`

## something else?

you can use the base image, and extend it with the xdg-portals you need.

# installed packages

see the full list of installed packages in [extra-packages](./extra-packages)

- `neovim` a very useful editor
- `chezmoi` - dot files manager
- `bat` - cat replacement with syntax highlighting
- `lsd` - an `ls` replacement
- `bitwarden-cli` - mostly for use with `chezmoi` for managing my dotfiles + credentials
- `lazygit` - a TUI for git, a very, very useful tool
- `mc` - midnight commander, a TUI File manager

... and many more

