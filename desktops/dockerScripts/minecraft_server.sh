#!/bin/bash

echo "Enter OP username"
read user
echo "Enter gamemode (e.g. survival)"
read gamemode
echo "Enter memory allocation (e.g. 4G)"
read memory
echo "Enter minecraft version (e.g. 1.19)"
read version

docker run -d \
  --name=minecraft \
  -e TZ=Europe/Berlin \
  -e TYPE=paper \
  -e OPS=$user \
  -e SEED= `#optional` \
  -e MODE=$gamemode \
  -e MEMORY=$memory \
  -e VERSION=$version \
  -e EULA=true \
  -p 25565:25565/tcp \
  -v //docker/appdata/minecraft:/data:rw itzg/minecraft-server:latest
  --restart unless-stopped \
  itzg/minecraft-server:latest