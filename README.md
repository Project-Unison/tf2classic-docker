# TF2Classic Docker Container
[Pterodactyl Panel](https://pterodactyl.io/) docker source engine image, originally forked from [their upstream](https://github.com/parkervcp/images/tree/ubuntu/source), but cleaned up and converted to use debian-slim and less dependencies, saving ~300MB per server instance.

This is modification of @sapphonie's srcds Dockerfiles, with TF2 Classic compatibility.

Note: this container can run bash if no args are passed or if `bash` is passed in the startup options.

## Difference with sapphonie's Dockerfiles
* Compatible with latest Debian-slim releases.
* Adds useful tools `tmux` and `nano` included by default.
* Designed for [Team Fortress 2 Classic](https://tf2classic.com) support.

## Requirements
* Any Linux server distros
* [Docker](https://www.docker.com/)

## How to use
Due to trouble with Docker Desktop, we use [GitHub Docker Packages](https://github.com/features/packages) for automated creation.

### Use with Docker
As of Dec 15 2023, the core version is deprecated and will no longer receive any updates to focus more on TF2Classic.

```
docker run -it --name tf2cserver --restart unless-stopped ghcr.io/project-unison/tf2classic-docker:latest
```

## Note
* This Docker scripts only prepares every dependencies to install TF2Classic Server, and does NOT automatically install server. Please refer to [official installation guide](https://wiki.tf2classic.com/wiki/Dedicated_Linux_server) for detailed instruction.

## License
This project is licensed under MIT License.