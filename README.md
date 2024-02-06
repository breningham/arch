# breningham/arch 

A custom OCI Image based of of [Bazzite-arch](https://github.com/ublue-os/bazzite-arch) using [boxkit](https://github.com/ublue-os/boxkit) for use in distrobox

# how to use

- make sure distrobox is installed 
- `distrobox create --image ghcr.io/breningham/arch -n arch` 
- `distrobox enter arch -- fish`

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