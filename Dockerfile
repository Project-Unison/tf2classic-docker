# ----------------------------------
# TF2Classic-Docker - A modification of pterodactyl's dockerfile.
# Originally created by Pterodactyl, Modified by sapphonie and Roon
# Some codes brought from https://github.com/joshuafhiggins/TF2-Classic, thank you!
# Environment: TF2 Classic
# ----------------------------------
FROM        debian:bookworm-slim

LABEL       author="Pterodactyl Software, sapphonie, Roon" maintainer="https://github.com/RoonMoonlight"

ENV         DEBIAN_FRONTEND noninteractive
ENV         TERM screen

# Upgrade our base system first
RUN         tput setaf 2; echo "TF2Classic-Docker 12.1 'Dark Cat' - A modification of pterodactyl's dockerfile by Roon. Originally created by Pterodactyl Software and sapphonie"; echo "Upgrading base image..."; tput sgr0; \
            apt update \
            && apt upgrade -y --no-install-recommends

# from postgressql - set up en_US.UTF8 locale so srcds doesn't whine
# https://github.com/docker-library/postgres/blob/69bc540ecfffecce72d49fa7e4a46680350037f9/9.6/Dockerfile#L21-L24
RUN         tput setaf 2; echo "Setting en_US.UTF8 locale..."; tput sgr0; \
            apt update \
            && apt install -y locales \
            && rm -rf /var/lib/apt/lists/* \
            && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV         LANG en_US.utf8

# install deps
RUN         tput setaf 2; echo "Installing dependencies..."; tput sgr0; \
            dpkg --add-architecture i386 \
            && apt update \
            && apt install -y --no-install-recommends \ 
            # needed for ip route stuff in entrypoint.sh
            net-tools iproute2 \
            # For SRCDS dependencies
            unzip aria2 lib32z1 libncurses5:i386 libbz2-1.0:i386 lib32gcc-s1 lib32stdc++6 libtinfo5:i386 libcurl3-gnutls:i386 libsdl2-2.0-0:i386 libcurl4-gnutls-dev libcurl4-gnutls-dev:i386 libxcb1 libxcb1:i386 \
            # needed for some sourcemod extensions
            curl wget libcurl4:i386 \
            # helpful tools
            python3 valgrind gdb tmux nano software-properties-common \
            # needed for steamcmd
            ca-certificates

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

# Expose ports
EXPOSE      27015/tcp \
            27015/udp \
            27020/udp

