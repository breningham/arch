FROM ghcr.io/ublue-os/arch-distrobox AS arch

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="A cloud-native terminal experience" \
      maintainer="brendan@ingham.dev"

COPY extra-packages /
RUN grep -v '^#' /extra-packages | xargs pacman -Syu --noconfirm 
RUN rm /extra-packages

RUN  ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/docker
RUN  ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/flatpak
RUN  ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman
RUN  ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/rpm-ostree
RUN  ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/transactional-update

RUN  rm -rf \
        /tmp/* \
        /var/cache/pacman/pkg/*

## KDE 
FROM arch AS arch-kde

LABEL name="arch-kde"

RUN pacman -Rnsdd xcursor-breeze --noconfirm
RUN pacman -Syu xdg-desktop-portal-kde --noconfirm

RUN  rm -rf \
        /tmp/* \
        /var/cache/pacman/pkg/*

FROM arch-kde AS arch-gnome 

## GNOME
LABEL name="arch-gnome"

# Replace KDE portal with GNOME portal, swap included icon theme.
RUN sed -i 's/-march=native -mtune=native/-march=x86-64 -mtune=generic/g' /etc/makepkg.conf && \
    pacman -Rnsdd \
        xdg-desktop-portal-kde \
        --noconfirm && \
    pacman -S \
        xdg-desktop-portal-gtk \
        xdg-desktop-portal-gnome \
        --noconfirm

# Cleanup
RUN sed -i 's/-march=x86-64 -mtune=generic/-march=native -mtune=native/g' /etc/makepkg.conf && \
    rm -rf \
        /tmp/* \
        /var/cache/pacman/pkg/*
