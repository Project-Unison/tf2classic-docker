# Source Engine Docker Container
[Pterodactyl Panel](https://pterodactyl.io/) docker source engine image, originally forked from [their upstream](https://github.com/parkervcp/images/tree/ubuntu/source), but cleaned up and converted to use debian-slim and less dependencies, saving ~300MB per server instance. Maintained by @sapphonie

Note: this container can run bash if no args are passed or if `bash` is passed in the startup options.

Usage:

`docker run -it creatorstf/pterodactyl-srcds-debian-buster`

Will use github's docker repository in the near future.
