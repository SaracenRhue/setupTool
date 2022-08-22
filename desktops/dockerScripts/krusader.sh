#!/bin/bash

sudo docker run -d \
-p 5900:5900 \
-p 6080:6080 \
--name=krusader \
--privileged=true \
-v /docker/appdata/krusader:/config \
-v /etc/localtime:/etc/localtime:ro \
-e TEMP_FOLDER=/config/krusader/tmp \
-e WEBPAGE_TITLE=Krusader \
-e VNC_PASSWORD= \
-e UMASK=000 \
-e PUID=0 \
-e PGID=0 \
binhex/arch-krusader