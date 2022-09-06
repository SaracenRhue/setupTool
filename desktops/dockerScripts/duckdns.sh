#!/bin/bash

sudo docker run -d \
--name=duckdns \
-e PUID=1000 `#optional` \
-e PGID=1000 `#optional` \
-e TZ=Europe/Vienna \
-e SUBDOMAINS=yourtrackerdomain.duckdns.org\
-e TOKEN=putTokenHere \
-e LOG_FILE=false `#optional` \
-v /path/to/appdata/config:/config `#optional` \
--restart unless-stopped \
lscr.io/linuxserver/duckdns:latest