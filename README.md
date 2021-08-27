# Bedrock Server

Run Minecraft Bedrock Server in Docker.

[![Build](https://github.com/asimbera/bedrock-server/actions/workflows/build-docker-image.yml/badge.svg)](https://github.com/asimbera/bedrock-server/actions/workflows/build-docker-image.yml)

## Features

- Automatic updates
- Periodic volume snapshot `Coming Soon`
- Web UI for easy management `Coming Soon`
- Telegram, Discord integration `Coming Soon`

## Usage

To use this docker image, make sure you are running on a linux host and latest version of docker is installed on system. You can check the version of docker with `docker -v`.

### Docker CLI

1. Clone this repo.
2. Go to example folder.
3. Make any changes to `server.properties`, `whitelist.json` or `permissions.json`.
4. Start with :

```sh
docker run -it -d \
 -v "$(pwd)"/server.properties:/app/server.properties \
 -v "$(pwd)"/permissions.json:/app/permissions.json \
 -v "$(pwd)"/whitelist.json:/app/whitelist.json \
 -v "$(pwd)"/worlds:/app/worlds \
 -p 19132:19132/udp \
 asimbera/bedrock-server
```

### Docker Compose

Make sure `docker-compose` is installed on your system. To install `docker-compose` refer to [wiki](https://docs.docker.com/compose/install/).

#### First Run

1. Clone this repo.
2. Go to example folder.
3. Make any changes to `server.properties`, `whitelist.json` or `permissions.json`.
4. Start with `docker-compose up -d`

#### Updating

1. Find container name with `docker ps`.
2. Attach to the container with `docker attach <container_name>`.
3. Stop the container with `stop` command in minecraft console.
4. Download latest image with `docker-compose pull`.
5. Restart the services with `docker-compose up -d`.

Refer to [docker-compose wiki](https://docs.docker.com/compose/) for more commands.

## Feedback

Any helpful feedback would be appreciated.

Issues and PRs are Welcome 💖
