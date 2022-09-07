#!/bin/bash

sudo docker container run -it \
  -p 80:3001 \
  -v /etc/os-release:/etc/os-release:ro \
  -v /proc/1/ns/net:/mnt/host_ns_net:ro \
  --privileged \
  --restart unless-stopped \
  mauricenino/dashdot