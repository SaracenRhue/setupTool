#!/bin/bash

sudo docker run -d \
--name=heimdall \
-e PUID=1000 \
-e PGID=1000 \
-e TZ=Europe/Berlin \
-p 5080:80 \
-v /docker/appdata/heimdall:/config \
--restart unless-stopped \
lscr.io/linuxserver/heimdall:latest