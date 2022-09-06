#!/bin/bash

sudo docker run -d \
--name=organizr \
-e PUID=1000 \
-e PGID=1000 \
-e TZ=Europe/Vienna \
-p 9983:80 \
-v /docker/appdata/organizr:/config \
--restart unless-stopped \
linuxserver/organizr