#!/bin/bash

docker run -d \
  --name=firefox \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Vienna \
  -p 3000:3000 \
  -v /docker/appdata/firefox:/config \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/firefox:latest