# ⚠️ Notice: Podman support is dropped ⚠️
**As of August 16, 2023, Podman support is dropped due to several issues that prevents me from using it and Docker is known to be widely used for production use. Podman should work as intended but NO support will be given regardless of the result. I advise you to use the Docker instead of podman. Thanks for understanding!**

# Source Engine Docker Container
[Pterodactyl Panel](https://pterodactyl.io/) docker source engine image, originally forked from [their upstream](https://github.com/parkervcp/images/tree/ubuntu/source), but cleaned up and converted to use debian-slim and less dependencies, saving ~300MB per server instance.

This is modification of @sapphonie's srcds Dockerfiles, originally designed for TF2C compatibility but expanded with more features.

Note: this container can run bash if no args are passed or if `bash` is passed in the startup options.

## Difference with sapphonie's Dockerfiles
* Supports most Source Engine servers. Source 2 support is planned in the future.
* Compatible with latest Debian-slim releases.
* Adds useful tools `tmux` and `nano` included by default.
* Adds [Team Fortress 2 Classic](https://tf2classic.com) support.

## Requirements
* Any Linux server distros
* [Docker](https://www.docker.com/)

## How to use
Due to trouble with Docker Desktop, we use [GitHub Docker Packages](https://github.com/features/packages) for automated creation.

To allow anyone to join your server, don't forget to expose your port (By default it is 27015 but can be changed) before creating the docker instances. Using the rcon is highly discouraged so only UDP ports are allowed, but if you are okay with rcon, remove `/udp` after the port to allow rcon access.

### Use with Docker
#### For most Source Engine servers
```
docker run -it --name srcdsserver -p 27015:27015/udp --restart unless-stopped ghcr.io/roonmoonlight/srcds-tf2c-debian:bookworm-core
```

#### For Team Fortress 2 Classic servers
```
docker run -it --name tf2cserver -p 27015:27015/udp --restart unless-stopped ghcr.io/roonmoonlight/srcds-tf2c-debian:bookworm
```

## Note
* This Docker scripts only prepares every dependencies to install any Source Games Server, and does NOT automatically install server. Please refer to each game's Documentations for installation. For easier alternatives, using LinuxGSM's [docker-gameserver](https://github.com/GameServerManagers/docker-gameserver) is highly recommended.

## License
This project is licensed under MIT License.
