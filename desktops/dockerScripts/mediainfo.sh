

sudo docker run -d \
--name=mediainfo \
-p 5877:5800 \
-v /docker/appdata/mediainfo:/config:rw \
-v $HOME:/storage:ro \
jlesage/mediainfo