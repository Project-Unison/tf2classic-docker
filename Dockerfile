# ----------------------------------
# Pterodactyl Panel Dockerfile
# Environment: All Source Engine Games
# ----------------------------------
FROM        debian:bookworm-slim

LABEL       author="Pterodactyl Software - edited by sapphonie and Roon" maintainer="https://github.com/RoonMoonlight"

ENV         DEBIAN_FRONTEND noninteractive
ENV         TERM screen

# Upgrade our base system first
RUN         tput setaf 2; echo "SRCDS Docker Script 12 'Bookworm' by Roon - a modification of Pterodactyl Docker File by Pterodactyl Software and sapphonie"; echo "Upgrading base image..."; tput sgr0; \
            apt-get update \
            && apt-get upgrade -y --no-install-recommends

# from postgressql - set up en_US.UTF8 locale so srcds doesn't whine
# https://github.com/docker-library/postgres/blob/69bc540ecfffecce72d49fa7e4a46680350037f9/9.6/Dockerfile#L21-L24
RUN         tput setaf 2; echo "Setting en_US.UTF8 locale..."; tput sgr0; \
            apt-get update \
            && apt-get install -y locales \
            && rm -rf /var/lib/apt/lists/* \
            && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV         LANG en_US.utf8

# install deps
RUN         tput setaf 2; echo "Installing dependencies..."; tput sgr0; \
            dpkg --add-architecture i386 \
            && apt-get update \
            && apt-get install -y --no-install-recommends \ 
            # needed for ip route stuff in entrypoint.sh
            net-tools iproute2 \
            # For SRCDS dependencies
            lib32z1 libbz2-1.0:i386 lib32gcc-s1 lib32stdc++6 libncurses5:i386 libsdl2-2.0-0:i386 lib32stdc++6 libtinfo5:i386 libcurl4-gnutls-dev:i386 \
            # needed for some sourcemod extensions
            curl wget libcurl4:i386 \
            # helpful tools
            python3 valgrind gdb tmux nano software-properties-common \
            # needed for steamcmd
            ca-certificates;
            # Adds non-free repository
            add-apt-repository non-free \
            && apt-get update \
            && apt-get install -y --no-install-recommends \
            # installs steamcmd
            steamcmd

# set nano as default editor
RUN         tput setaf 2; echo "Setting nano as default editor..."; tput sgr0; \
            update-alternatives --set editor /bin/nano

# set up our container user
RUN         tput setaf 2; echo "Creating container user..."; tput sgr0; \
            useradd -U -m -d /home/container -s /bin/bash container

RUN         tput setaf 2; echo "Done!"; tput sgr0;

USER        container:container
ENV         HOME /home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
