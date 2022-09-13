#!/bin/bash

echo "set your root password"
read rootPassword
echo "set your user password"
read userPassword

sudo docker run -d \
  --name=code-server \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Vienna \
  -e PASSWORD=$userPassword \
  -e HASHED_PASSWORD= `#optional` \
  -e SUDO_PASSWORD=$rootPassword \
  -e SUDO_PASSWORD_HASH= `#optional` \
  -e PROXY_DOMAIN=code-server.my.domain `#optional` \
  -e DEFAULT_WORKSPACE=/config/workspace `#optional` \
  -p 5500:8443 \
  -v //docker/appdata/code-server:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/code-server:latest