#!/bin/bash

sudo docker run -d \
  --name=resilio-sync \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Vienna \
  -p 8888:8888 \
  -p 55555:55555 \
  -v /docker/appdata/resilio/config:/config \
  -v /docker/appdata/resilio/downloads:/downloads \
  -v /docker/appdata/resilio/sync:/sync \
  --restart unless-stopped \
  lscr.io/linuxserver/resilio-sync:latest