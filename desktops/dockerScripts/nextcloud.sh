#!/bin/bash

sudo docker run -d \
--name=nextcloud \
-e PUID=1000 \
-e PGID=1000 \
-e TZ=Europe/Vienna \
-p 444:443 \
-v /docker/appdata/nextcloud/config:/config \
-v /docker/appdata/nextcloud/data:/data \
--restart unless-stopped \
lscr.io/linuxserver/nextcloud:latest