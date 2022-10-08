#!/bin/bash
echo "enter your duckdns token"
read token
echo "enter your duckdns domain"
read domain

sudo docker run -d \
--name=duckdns \
-e PUID=1000 `#optional` \
-e PGID=1000 `#optional` \
-e TZ=Europe/Vienna \
-e SUBDOMAINS=$domain \
-e TOKEN=$token \
-e LOG_FILE=false `#optional` \
-v /path/to/appdata/config:/config `#optional` \
--restart unless-stopped \
lscr.io/linuxserver/duckdns:latest