# Source Engine Docker Container
[Pterodactyl Panel](https://pterodactyl.io/) docker source engine image, originally forked from [their upstream](https://github.com/parkervcp/images/tree/ubuntu/source), but cleaned up and converted to use debian-slim and less dependencies, saving ~300MB per server instance. Maintained by @sapphonie

This is modification of sapphonie's srcds Dockerfiles which includes all files necessary for TF2C.

Note: this container can run bash if no args are passed or if `bash` is passed in the startup options.

### How to use
Due to trouble with Docker Desktop, we use [GitHub Docker Packages](https://github.com/features/packages) for automated creation.

Usage:

```
docker run -it ghcr.io/roonmoonlight/srcds-tf2c-debian:bullseye
```

### Note
* This Docker scripts prepares everything dependencies to install TF2C Server, and does NOT automatically install TF2C server.
* It is recommended to use with @sapphonie's [SRCDS Hardening Tool](https://github.com/sapphonie/tf2-srcds-hardening-iptables-docker) for maximum security.