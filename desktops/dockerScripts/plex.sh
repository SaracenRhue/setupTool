#!/bin/bash

sudo docker run -d \
  --name=plex \
  --net=bridge \
  -e PUID=1000 \
  -e PGID=1000 \
  -e VERSION=docker \
  -e PLEX_CLAIM= `#optional` \
  -p 32400:32400 \
  -v /docker/appdata/plex:/config \
  -v /home/$USER/plexMedia/tvseries:/tv \
  -v /home/$USER/plexMedia/movies:/movies \
  --restart unless-stopped \
  lscr.io/linuxserver/plex:latest