#!/bin/bash

sudo docker run -d \
--name=nginx-proxy-manager \
-p 7818:8181 \
-p 1880:8080 \
-p 18443:4443 \
--restart=always \
-v /docker/appdata/nginx-proxy-manager:/config:rw \
jlesage/nginx-proxy-manager