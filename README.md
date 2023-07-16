# Source Engine Docker Container
[Pterodactyl Panel](https://pterodactyl.io/) docker source engine image, originally forked from [their upstream](https://github.com/parkervcp/images/tree/ubuntu/source), but cleaned up and converted to use debian-slim and less dependencies, saving ~300MB per server instance. Maintained by @sapphonie and modified by Roon

This is modification of sapphonie's srcds Dockerfiles which includes all files necessary for TF2C.

Note: this container can run bash if no args are passed or if `bash` is passed in the startup options.

### How to use
Due to trouble with Docker Desktop, we use [GitHub Docker Packages](https://github.com/features/packages) for automated creation. To allow anyone to join your server, don't forget to expose your port (By default it is 27015 but can be changed) before creating the docker instances.

Usage:

```
docker run -it --expose 27015 ghcr.io/roonmoonlight/srcds-tf2c-debian:bookworm
```

### Note
* This Docker scripts prepares everything dependencies to install TF2C Server, and does NOT automatically install TF2C server.
